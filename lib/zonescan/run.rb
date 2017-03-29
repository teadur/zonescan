# Zonescan
module Zonescan
  # Run function
  class << self
    def source
      @source ||= read
    end

    def processed_source
      @processed_source ||= source.split("\n").uniq
    end

    def read
      if @files.nil?
        # for tests to work
        @files = "./data/first.txt"
      end
      readme = File.expand_path(@files)
      File.read(readme)
    rescue Exception => error
      puts __dir__
      puts error
      #readme = File.expand_path(@files)
      puts readme
      file_path = File.join((__dir__), '../../data/first.txt')
      puts "File open error #{error}"
      exit 1
    end

    def run(files)
      @files = files
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
