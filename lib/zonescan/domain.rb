module Zonescan
  # Base class for Zonescan
  #class Domain < Base
  class << self
    #attr_accessor :Untested
    def domain
      processed_source.sample
    end

    def domains(n = 5)
      processed_source.sample(n)
    end

    def validate(name = 'test')
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

    def resolv(name)
      Resolv.getaddress(name)
      return true
    rescue
      puts "doesnot resolve #{name}"
      return false
    end

    def domains_all
      @Untested = Array[]
      processed_source.each do |item|
        @Untested.push(item)
        puts item
      end
    end
  end
end
