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
      Completed.push(result) if rvalue >= 200 && rvalue <= 500
  else
    Failed.push(name)
    puts "remove name from uncompleted list / add it to failed list #{name}"
    end

  end
  puts "Total: #{total}\nFailed (#{Failed.count}): #{Failed} \n"
  puts "Completed(#{Completed.count}): #{Completed}"
  end_time = Time.now
  puts "Time elapsed #{(end_time - beginning_time)} seconds"
end