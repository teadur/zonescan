# Zonesacn
module Zonescan
  # Input / Output related functions
  class << self
    def source
      @source ||= read
    end

    def processed_source
      @processed_source ||= source.split("\n").uniq
    end

    def read
      # TODO: ugly fix for path issue
      # figure out correct solution for the problem
      File.read(File.expand_path('../data/first.txt'))
    rescue
      # puts 'io error'
      File.read(File.expand_path('./data/first.txt'))
    end
  end
end
