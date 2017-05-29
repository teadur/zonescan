# Zonescan
module Zonescan
  # Domain related functions
  class << self
    def domain
      processed_source.sample
    end

    def domains(n = 5)
      processed_source.sample(n)
    end

    def validate(name = 'test')
      # puts "validate: #{name}"
      if name['.'].nil?
        # puts "missing dot"
        return false
      else
        # check if the name resolves
        dns_result = resolv(name)
        if dns_result.equal?(true)
          # puts "resolv: #{resolv(name)}"
          return true
        else
          return dns_result
        end
      end
    end

    def resolv(name)
      Resolv.getaddress(name)
      return true
    rescue Resolv::ResolvError => e
      # ap e.message
      # TODO: validate dnssec
      # ap Resolv
      # puts "doesnot resolve #{name}"
      return e.message
    end

    def domains_all(list=nil)
      @untested = Array[]
      if list != nil
         list = list.split(",")
        list.each do |item|
          @untested.push(item)
        end

      else
        processed_source.each do |item|
          @untested.push(item)
          # puts item
        end
      end
    end
  end
end
