require 'Minitest/autorun'
require 'Minitest/pride'
require 'mocha/minitest'
require './lib/file_io'

class IOTest < Minitest::Test
    
    def setup
      ARGV.replace(['message.txt','braille.txt'])
      @io = IO.new
      # require 'pry'; binding.pry
    end

    def test_it_exsist()
        
      assert_instance_of IO, @io
    end

    def test_word_count

        assert_equal 9, @io.word_count
    end

    def test_output

      expected = "Created braille.txt" + " containing 9 characters"
    end
end