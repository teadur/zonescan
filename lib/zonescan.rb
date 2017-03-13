require_relative 'zonescan/version'
require_relative 'zonescan/base'
require_relative 'zonescan/domain'
require_relative 'zonescan/http_scan'
require 'curb'
require 'resolv'
# Zonescan::
module Zonescan
  # Your code goes here...
  puts __FILE__
  name = Domain.domain
  puts name
  if Domain.validate(name) == true
    puts 'lets call out scanner for that name'
    Httpscan.check(name)
  else
    puts 'lets remove that name from uncompleted list / add it to failed list'
  end
end
