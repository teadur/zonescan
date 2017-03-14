require_relative 'zonescan/version'
require_relative 'zonescan/base'
require_relative 'zonescan/domain'
require_relative 'zonescan/http_scan'
require 'curb'
require 'resolv'
# Zonescan::
module Zonescan
  # Your code goes here...
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
      rvalue =  Httpscan.check(name)
      # add domains with return code 200-500 to Completed list
      # TODO: Figure out exact return codes i care about
      Completed.push(name) if rvalue >= 200 && rvalue <= 500
  else
    Failed.push(name)
    puts "remove name from uncompleted list / add it to failed list #{name}"
    end

  end
  puts "Total: #{total}\nFailed (#{Failed.count}): #{Failed} \n"
  puts "Completed(#{Completed.count}): #{Completed}"
end
