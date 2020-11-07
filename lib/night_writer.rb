require './lib/cli'
require './lib/translator'

class NightWriter
  attr_reader :cli

    def initialize
      @cli = CLI.new  
    end

    def output
      @cli.output
    end


end




