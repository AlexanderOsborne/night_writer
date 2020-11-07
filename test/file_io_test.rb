require 'Minitest/autorun'
require 'Minitest/pride'
require 'mocha/minitest'
require './lib/file_io'

class IOTest < Minitest::Test
    
    def setup
      @io = IO.new
      @io.stubs(:ARGV[0]).returns('message.txt')
      @io.stubs(:ARGV[1]).returns('braille.txt')
    end

    def test_it_exsist()
        
      assert_instance_of IO, @io
    end

    def test_copy()

        assert_equal 0, @io.copy
    end
end