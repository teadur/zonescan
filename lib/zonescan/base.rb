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
      File.read(File.expand_path('data/first.txt'))
    end
  end
end
