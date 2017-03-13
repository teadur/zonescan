require_relative 'zonescan/version'
require_relative 'zonescan/base'
require_relative 'zonescan/domain'
require_relative 'zonescan/http_scanner'

module Zonescan
  # Your code goes here...
  puts __FILE__
  name = Domain.domain
  puts name
  if Domain.validate(name) == true
    puts "lets call out scanner for that name"
  else
    puts "lets remove that name from uncompleted list"
  end

end
