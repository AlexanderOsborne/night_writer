require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/cli'

class CLITest < Minitest::Test
    
    def setup
        @cli = CLI.new
    end

    def test_get_args
        skip 

        assert_equal "message.txt", @cli.to_read
    end
end