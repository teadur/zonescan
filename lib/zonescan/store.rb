module Zonescan
  # Zonescan::Store Class to interact with results store
  class Store
  #class << self
    require 'yaml/store'
    def self.initialize
         store = YAML::Store.new('data/store.yml')
    end

    def self.show(name)
      store = YAML::Store.new('data/store.yml')
      store.transaction do
        store.roots.each do |current|
          if store[current][:name] = name
            puts store[current]
          end
        end
      end
    end # End of show

    def write(*)
    end # End of write
  end # End of class
end # End of module
