# Zonescan
module Zonescan
  # Run function
  class << self
    def run
      @failed = Array[]
      @completed = Array[]
      @untested = Array[]

      beginning_time = Time.now

      # puts __FILE__
      execute = domains_all
      total = execute.count
      @untested.each do |name|
        if validate(name) == true
          # puts "debug: lets call out scanner for that name #{name}"
          rvalue =  Httpscan.check(name).to_i
          # add domains with return code 200-500 to Completed list
          # TODO: Figure out exact return codes i care about
          result = Hash.new
          result[:name] = name
          result[:rcode] = rvalue
          result[:time] = Time.now
          @completed.push(result) if rvalue >= 200 && rvalue <= 500
        else
          result = Hash.new
          result[:name] = name
          result[:reason] = 'Unknown'
          result[:time] = Time.now
          @failed.push(result)
          # puts "debug: remove name from uncompleted list / add it to failed list #{name}"
        end

      end
      Zonescan::Store.write(@completed)
      Zonescan::Store.write(@failed)
      # TODO: implement debug/verbose flag
      # puts "Total: #{total}\nFailed (#{@Failed.count}): #{@Failed} \n"
      # puts "Completed(#{@Completed.count}): #{@Completed}"
      puts "Total: #{total} Failed: (#{@failed.count}) Completed: #{@completed.count}"
      end_time = Time.now
      puts "Time elapsed #{(end_time - beginning_time)} seconds"
    end # Method run end
  end # Class end
end
