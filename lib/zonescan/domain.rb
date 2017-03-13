module Zonescan
  # Base class for Zonescan
  class Domain < Base
    def self.domain
      processed_source.sample
    end

    def self.domains(n = 5)
      processed_source.sample(n)
    end

    def self.validate(name = 'test')
      if name['.'].nil?
        # puts "missing dot"
        return false
      else
        # check if the name resolves
        if resolv(name).equal?(true)
          return true
        else return false
        end
      end
    end

    def self.resolv(name)
      Resolv.getaddress(name)
      return true
    rescue
      puts 'ei lahendu'
      return false
    end

    def self.domains_all
      processed_source.each do |item|
        Untested.push(item)
        puts item
      end
    end
  end
end
