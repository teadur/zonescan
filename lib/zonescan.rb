require_relative 'zonescan/version'
require_relative 'zonescan/base'
require_relative 'zonescan/domain'
require_relative 'zonescan/http_scan'
require 'curb'
require 'resolv'
# Zonescan::
module Zonescan
  # Your code goes here...
  Failed = Array.new
  Completed = Array.new
  Untested = Array.new
  puts __FILE__
  # name = Domain.domain
  # puts name
  Domain.domains_all
  Untested.each do |name|
  if Domain.validate(name) == true
    puts 'lets call out scanner for that name'
    rvalue =  Httpscan.check(name)
    # add domains with return code 200-500 to Completed list
    # TODO: Figure out exact return codes i care about
    if rvalue >= 200 && rvalue <= 500
      Completed.push(name)
    end
  else
    Failed.push(name)
    puts 'lets remove that name from uncompleted list / add it to failed list'
  end

  end
  puts "Failed: #{Failed} \nCompleted: #{Completed}"
end
