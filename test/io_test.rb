require 'Minitest/autorun'
require 'Minitest/pride'
require 'mocha/minitest'
require './lib/io'

class IOTest < Minitest::Test
    
    def setup
      ARGV.replace(['message.txt','braille.txt'])
      @io = IO.new
    end

    def test_it_exsist()
        
      assert_instance_of IO, @io
    end

    def test_word_count

      assert_equal 69, @io.word_count
    end

    def test_output

      expected = "Created braille.txt" + " containing 69 characters"
      assert_equal expected, @io.output
    end

    def test_copy
      
      @io.copy("braille.txt")

      assert_equal true, File.exist?("braille.txt")
    end

    def test_split_by_char

      expected = ["i", "m", " ", "n", "o", "t", " ", "z", "e", "r", "o", " ", "w", "o", "r", "d", "s", " ", "i", " ", "a", "m", " ", "h", "o", "w", "e", "v", "e", "r", " ", "q", "u", "i", "t", "e", " ", "a", " ", "f", "e", "w", " ", "m", "o", "r", "e", " ", "t", "h", "a", "n", " ", "f", "o", "r", "t", "y", " ", "c", "h", "a", "r", "a", "c", "t", "e", "r", "s"]
      assert_equal expected, @io.split_by_char
    end

    def test_group_by_40_chars
      skip
      expected = [["i", "m", " ", "n", "o", "t", " ", "z", "e", "r", "o", " ", "w", "o", "r", "d", "s", " ", "i", " ", "a", "m", " ", "h", "o", "w", "e", "v", "e", "r", " ", "q", "u", "i", "t", "e", " ", "a", " ", "f"], ["e", "w", " ", "m", "o", "r", "e", " ", "t", "h", "a", "n", " ", "f", "o", "r", "t", "y", " ", "c", "h", "a", "r", "a", "c", "t", "e", "r", "s"]]
      assert_equal expected, @io.group_by_40_chars
    end

    def test_group_by_40

      expected = "im not zero words i am however quite a f\new more than forty characters"
      assert_equal expected, @io.group_by_40
    end
end