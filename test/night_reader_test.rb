require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/io'
require './lib/night_reader'
require './lib/translator'

class NightReaderTest < Minitest::Test
  
  def setup
    @io = IO.new "braille.txt", "original_message.txt"
    @nightreader = NightReader.new "braille.txt", "original_message.txt"
    @braille_text  = "thisisabigdummystringoftext"
  end

  def test_it_exsist

    assert_instance_of NightReader, @nightreader
  end

  def test_read_line

    expected = [".000..000..0..0.0.0.0....00.0.00.0...0..0.00..0.0..00.0.0.0...000..0.00...0...00",
      "0......0.000...0.000.0..00.000.00...0.........00.000.00..000..00..0.00.0......0.",
      "..0...0.0.0...00..0.0....00.0...0.........0.....0..0..00..0...0.00..0...........",
      "0..0..000.0.0....00.0.00..000.0..000..000.0.0.0.00.00.0..0",
      ".000.....000.0..0000...0..0..00000.0....00..00....00.0000.",
      "...0..0.0.0.....0.....0.....0.0.0.00........0.....0...0.0."]
    assert_equal expected, @nightreader.read_lines
  end

  def test_sort_line
    @nightreader.read_lines
    @nightreader.sort_lines
    
    expected = [".000..000..0..0.0.0.0....00.0.00.0...0..0.00..0.0..00.0.0.0...000..0.00...0...000..0..000.0.0....00.0.00..000.0..000..000.0.0.0.00.00.0..0", "0......0.000...0.000.0..00.000.00...0.........00.000.00..000..00..0.00.0......0..000.....000.0..0000...0..0..00000.0....00..00....00.0000.", "..0...0.0.0...00..0.0....00.0...0.........0.....0..0..00..0...0.00..0..............0..0.0.0.....0.....0.....0.0.0.00........0.....0...0.0.", ".000..000..0..0.0.0.0....00.0.00.0...0..0.00..0.0..00.0.0.0...000..0.00...0...000..0..000.0.0....00.0.00..000.0..000..000.0.0.0.00.00.0..0", "0......0.000...0.000.0..00.000.00...0.........00.000.00..000..00..0.00.0......0..000.....000.0..0000...0..0..00000.0....00..00....00.0000.", "..0...0.0.0...00..0.0....00.0...0.........0.....0..0..00..0...0.00..0..............0..0.0.0.....0.....0.....0.0.0.00........0.....0...0.0."]
  
    assert_equal expected, @nightreader.sort_lines
  end

  def test_line_by_char

    @nightreader.read_lines
    @nightreader.sort_lines
    @nightreader.line_by_char

    expected = [[".0", "00", "..", "00", "0.", ".0", "..", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "00", ".0", "..", ".0", "..", "0.", "00", "..", "0.", "0.", ".0", "0.", "0.", "0.", "0.", "..", "00", "0.", ".0", ".0", "0.", "..", "0.", "..", "00", "0.", ".0", "..", "00", "0.", "0.", "0.", "..", ".0", "0.", "0.", "00", "..", "00", "0.", "0.", ".0", "00", "..", "00", "0.", "0.", "0.", "0.", "00", ".0", "0.", "0.", ".0"], ["0.", "..", "..", ".0", ".0", "00", "..", ".0", ".0", "00", ".0", "..", "00", ".0", "00", ".0", "0.", "..", "0.", "..", "..", "..", "..", "00", ".0", "00", ".0", "0.", ".0", "00", "..", "00", "..", "0.", "00", ".0", "..", "..", "..", "0.", ".0", "00", "..", "..", ".0", "00", ".0", "..", "00", "00", "..", ".0", "..", "0.", ".0", "00", "00", ".0", "..", "..", "00", "..", "00", "..", "..", "00", ".0", "00", "0."], ["..", "0.", "..", "0.", "0.", "0.", "..", "00", "..", "0.", "0.", "..", ".0", "0.", "0.", "..", "0.", "..", "..", "..", "..", "0.", "..", "..", "0.", ".0", "..", "00", "..", "0.", "..", "0.", "00", "..", "0.", "..", "..", "..", "..", "..", "..", ".0", "..", "0.", "0.", "0.", "..", "..", "0.", "..", "..", "0.", "..", "..", "0.", "0.", "0.", "00", "..", "..", "..", "..", "0.", "..", "..", "0.", "..", "0.", "0."]]

    assert_equal expected, @nightreader.scanned_lines
  end

  def test_index_hash
  
    @nightreader.read_lines
    @nightreader.sort_lines
    @nightreader.line_by_char
    @nightreader.index_hash

    assert_equal true, @nightreader.braille_hash.has_value?("0. 00 ..")
  end

  def test_translate
    skip
    @nightreader.read_lines
    @nightreader.sort_lines
    @nightreader.line_by_char
    @nightreader.index_hash

    assert_equal nil, @nightreader.translate
  end

  def test_output

    equal = "Created original_message.txt containing 69 characters"
    assert_equal equal, @nightreader.output
  end

  def test_word_count
    
    assert_equal 69, @nightreader.word_count
  end
end