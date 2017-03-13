module Zonescan
  # Base class loads the input file and processes it
  class Base
    def self.source
      @source ||= read
    end

    def self.processed_source
      @processed_source ||= source.split("\n").uniq
    end

    def self.read
      # TODO: ugly fix for path issue
      # figure out correct solution for the problem
      File.read(File.expand_path('../data/first.txt'))
    rescue
      puts 'io error'
      File.read(File.expand_path('./data/first.txt'))
    end
  end
end
