require 'zonescan/store'

# Zonescan Module
module Zonescan
  # Zonescan::Cli
  # class Cli
    #class << self < Store
    #attr_accessor :Failed
    #attr_accessor :Completed
    #attr_accessor :Untested
    #end
    #class < Store

    #end
    def self.cli()
      require 'optparse'

      ARGV << '-h' if ARGV.empty?
      options = {}
      ARGV.options do |opts|
        opts.banner = "Usage: #{PROJECT} [file or files] \n"\
                      "       #{PROJECT} [options]"
        opts.on('-f', '--files [files]',           Array,     'Comma separated files to check')     { |val| options['files'] = val }
        opts.on('-r', '--record',                    TrueClass, 'Record results')         { |val| options['record'] = val }
        opts.on('-s', '--show [name]',           String,     'show saved results of domain')     { |val| options['show'] = val }

        opts.on_tail('--help') do
          puts opts
          exit
        end
        opts.parse!
      end

# Figure out what files to parse
      files = options['files']
      if files.nil?
        files = []
        ARGV.each do |a|
          files.push a if a !~ /^--.*/
        end
      end
      show = options['show']
      if show.nil?
      run
      end
      puts "cli #{files}"
      puts "show #{show}"
      unless show.nil?
        puts "access datastore and find domain(s)"
        Zonescan::Store.show(show)


      end
    end



#end # End of class
end # End of Module
