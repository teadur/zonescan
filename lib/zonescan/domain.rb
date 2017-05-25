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
      # TODO: return actual error
      puts "doesnot resolve #{name}"
      return false
    end

    def domains_all(list=nil)
      @untested = Array[]
      if list != ""
         list = list.split(",")
      #  puts "lõhume siin"
      #  puts "list: #{list}"
        list.each do |item|
          @untested.push(item)
          # puts "@untested: #{@untested}"
        end

      else
        processed_source.each(list) do |item|
          @untested.push(item)
          # puts item
        end
      end
    end
  end
end
