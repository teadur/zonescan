module Zonescan
  # Zonescan::Store Class to interact with results store
  class Store
    require 'yaml/store'
    # TODO: figure out why initialize doesnot do what i want ?
    # def self.initialize
    #  store = YAML::Store.new('data/store.yml')
    # end

    def self.show(name)
      count = 0
      store = YAML::Store.new('data/store.yml')
      store.transaction do
        store.roots.each do |current|
          # puts "debug: #{store[current][:name].to_s} and #{name}"
          if store[current][:name].to_s == name
            # puts "if debug: #{store[current][:name]} and #{name}"
            # display results
            puts store[current]
            count += 1
          end

        end
        puts "Found #{count} results"
      end
    end # End of show

    def self.write(result)
      require 'yaml/store'
      store = YAML::Store.new('data/store.yml')
      # data = store.transaction { store[:data] }
      store.transaction do
        id = store.roots.max || 0
        # puts "id: #{id}"

        # Handle completed domains
        result.each do |current|
          id += 1

          # puts "Storing: #{current}"
          extended = current
          # awesome_print extended
          if extended[:http_code]
          extended[:status] = 'Completed'
          end
          extended[:id] = id
          store[id] = extended
          puts "Stored: #{store[id]}"
        end
      end # End of store transaction
    end # End of write
  end # End of class
end # End of module
