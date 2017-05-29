module Zonescan
  # Zonescan:Httpscan
  class Httpscan
    # TODO: implement debug/verbose output
    def self.check(url)
      # puts "check_http #{url}"
      c = Curl::Easy.new(url)
      # c.verbose = true
      c.perform
      # puts "debug: #{c.response_code}"
      return c.response_code
    end

    # Check https
    # TODO: Gather/Store certificate data
    def self.check_https(url)
      # puts "check_https #{url}"
      errors =""
      url = "https://" + url
      c = Curl::Easy.new(url)
      # c.verbose = true
      c.perform
    rescue Curl::Err::SSLPeerCertificateError
        errors +=  "SSLPeerCertificateError "

    rescue Curl::Err::SSLCACertificateError
      errors += "SSLCACertificateError "

    rescue Curl::Err::ConnectionFailedError
       errors += "ConnectionFailedError"
      # puts "errors: #{errors}"
      #puts "verify_peer #{c.ssl_verify_peer?}"
      # puts "debug: #{c.response_code}"
      return errors
    end

  end
end
