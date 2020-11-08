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

        assert_equal 54, @io.word_count
    end

    def test_output

      expected = "Created braille.txt" + " containing 55 characters"
      assert_equal expected, @io.output
    end

    def test_copy
      @io.copy

      assert_equal true, File.exist?("braille.txt")
    end

    def test_split_by_char

      expected = ["z", "b"]
      assert_equal expected, @io.split_by_char
    end
end