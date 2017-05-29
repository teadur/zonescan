# Zonescan
module Zonescan
  # Run function
  class << self
    def source
      @source ||= read
    end

    def list
      @list = new Array[]
    end

    def processed_source(list=nil)

      if list.nil?
        # Lets read from file stream
        @processed_source ||= source.split("\n").uniq
      else
        # Lets read from input
        @processed_source ||= list

      end
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

    def run(files, list=nil)
      @files = files
      @failed = Array[]
      @completed = Array[]
      @untested = Array[]
      beginning_time = Time.now
      # puts "run: #{list}"

      # puts __FILE__
      if list.nil?
        execute = domains_all
      else
        execute = domains_all(list)
      end

      total = execute.count

      @untested.each do |name|
        dns = validate(name)
        # puts "#{name} - #{dns}"
        # puts "untested.each #{name}"
        if dns == true
          # puts "debug: lets call out scanner for that name #{name}"
          # puts dns
          rvalue =  Httpscan.check(name).to_i
          # TODO: Handle https check result to status
          https = Httpscan.check_https(name)
          # puts "https: #{https}"
          # add domains with return code 200-500 to Completed list
          # TODO: Figure out exact return codes i care about
          result = Hash.new
          result[:name] = name
          result[:http_code] = rvalue
          result[:https] = https
          result[:time] = Time.now
          result[:dns] = dns
          @completed.push(result) if rvalue >= 200 && rvalue <= 500
          # @failed.push(result) if rvalue <= 199 && rvalue <= 501
        else
          result = Hash.new
          result[:name] = name
          # result[:reason] = 'Unknown'
          result[:dns] = dns
          result[:http_code] = false
          result[:https] = false
          result[:time] = Time.now
          result[:status] = "Failed"
          @failed.push(result)
          # puts "debug: remove name from uncompleted list / add it to failed list #{name}"
        end

      end
      # if the input is from filesystem write to output to filesystem
      if list.nil?
      Zonescan::Store.write(@completed)
      Zonescan::Store.write(@failed)
      end
      # TODO: implement debug/verbose flag
      # puts "Total: #{total}\nFailed (#{@Failed.count}): #{@Failed} \n"
      # puts "Completed(#{@completed.count}): #{@completed}"
      stats = "Total: #{total} Failed: (#{@failed.count}) Completed: #{@completed.count}"
      puts stats
      end_time = Time.now
      totaltime = (end_time - beginning_time)
      # puts "Time elapsed #{(end_time - beginning_time)} seconds"
      puts "Time elapsed #{totaltime} seconds";
      return @completed,@failed,totaltime,stats

      # TODO: decide if sending back object hash would be better
      # vastus = { id: 1}
      # return vastus
    end # Method run end
  end # Class end
end
