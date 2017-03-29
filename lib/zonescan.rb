require_relative 'zonescan/version'
require_relative 'zonescan/base'
require_relative 'zonescan/domain'
require_relative 'zonescan/http_scan'
require_relative 'zonescan/cli'
require 'curb'
require 'resolv'
# Zonescan::
module Zonescan
  beginning_time = Time.now

# TODO: create run function and move to instance variables
    Failed = Array[]
    Completed = Array[]
    Untested = Array[]

    puts __FILE__
# name = Domain.domain
# puts name
    execute = Domain.domains_all
    total = execute.count
    Untested.each do |name|
      if Domain.validate(name) == true
        puts "lets call out scanner for that name #{name}"
        rvalue =  Httpscan.check(name).to_i
        # add domains with return code 200-500 to Completed list
        # TODO: Figure out exact return codes i care about
        result = Hash.new
        result[:name] = name
        result[:rcode] = rvalue
        result[:time] = Time.now
        Completed.push(result) if rvalue >= 200 && rvalue <= 500
      else
        result = Hash.new
        result[:name] = name
        result[:reason] = 'Unknown'
        result[:time] = Time.now
        Failed.push(result)
        puts "remove name from uncompleted list / add it to failed list #{name}"
      end

    end
    puts "Total: #{total}\nFailed (#{Failed.count}): #{Failed} \n"
    puts "Completed(#{Completed.count}): #{Completed}"
    end_time = Time.now
    puts "Time elapsed #{(end_time - beginning_time)} seconds"
    # Implement storing of results
    require 'yaml/store'
    store = YAML::Store.new('data/store.yml')
    data = store.transaction { store[:data] }
    store.transaction do
	    id = store.roots.max || 0
	    puts "id: #{id}"

	    Completed.each do |current|
		    id = id + 1 

		    puts current
		    store[id] = current
	    end
	    Failed.each do |current|
		   id = id + 1
		  store[id] = current
	    end
	    p store.roots
	    puts "map:"
	    p store.roots.map { |id| store[:id] } 
	    p store[1]
	    p store[1][:name]
	    store.roots.each do |current|
			
		    puts current
		    puts store[current][:name]
		   # puts "data: #{current[:name]} "
		    #
	    end
      #store[:Failed] = Failed
    end
puts	 data
    #data[:Completed].push(Completed)
  
  end

#  Zonescan::Cli.check
