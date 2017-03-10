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
        # TODO: how to read file so that tests dont fail ( path issues )
#      File.read(File.expand_path('../data/first.txt', __FILE__))
      File.read(File.expand_path('../data/first.txt'))

      #tee = File.expand_path("../../", __FILE__)
      #ile.read(tee/first.txt)
    end
  end
end
