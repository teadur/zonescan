module Zonescan
  # Base class for Zonescan
  class Domain < Base
    def self.domain
      processed_source.sample
    end

    def self.domains(n = 5)
      processed_source.sample(n)
    end

    def self.validate(name = "test")
      if name['.'].nil?
      # puts "missing dot"
        return false
      else
      #  puts "dot is present"
        return true
        end

    end
  end
end
