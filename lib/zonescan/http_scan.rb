module Zonescan
  # Zonescan:Httpscan
  class Httpscan
    # TODO: implement debug/verbose output
    def self.check(url)
      c = Curl::Easy.new(url)
      # c.verbose = true
      c.perform
      # puts "debug: #{c.response_code}"
      return c.response_code
    end
  end
end
