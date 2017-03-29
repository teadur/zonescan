module Zonescan
  # Zonescan::Store Class to interact with results store
  class Store
  #class << self
    require 'yaml/store'
    def self.initialize
         store = YAML::Store.new('data/store.yml')
    end

    def self.show(name)
      count = 0
      store = YAML::Store.new('data/store.yml')
      store.transaction do
        store.roots.each do |current|
          # puts "debug: #{store[current][:name].to_s} and #{name}"
          if store[current][:name].to_s == name
            # puts "if debug: #{store[current][:name]} and #{name}"
            puts store[current]
            count = count + 1
          end

        end
        puts "Found #{count} results"
      end
    end # End of show

    def write(*)
    end # End of write
  end # End of class
end # End of module
