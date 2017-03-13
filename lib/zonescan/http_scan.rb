module Zonescan
  # Zonescan:Httpscan
  class Httpscan < Base
    def self.check(url)
      # url = "internet.ee"
      c = Curl::Easy.new(url)
      # c.verbose = true
      c.perform
      puts c.response_code
      return c.response_code
    end
  end
end
