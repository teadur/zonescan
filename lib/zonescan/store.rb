module Zonescan
  # Class to interact with results store
  class Store
    def initialize
         store = YAML::Store.new('data/store.yml')
    end

    def show(name)
      store.transaction do
        store.roots.each do |current|
          if store[current][:name] = show
            puts store[current]
          end
        end
      end
    end # End of show
  end # End of class
end # End of module
