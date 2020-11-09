require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/night_reader'
require './lib/io'
require './lib/translator'

class NightReaderTest < Minitest::Test
  
  def setup
    @nightreader = NightReader.new
    ARGV.replace(['braille.txt','original_message.txt'])
  end

  def test_it_exsist

    assert_instance_of NightReader, @nightreader
  end

  def test_line
    
    expected = [".000..000..0..0.0.0.0....00.0.00.0...0..0.00..0.0..00.0.0.0...000..0.00...0...00", "0......0.000...0.000.0..00.000.00...0.........00.000.00..000..00..0.00.0......0.", "..0...0.0.0...00..0.0....00.0...0.........0.....0..0..00..0...0.00..0...........", "0..0..000.0.0....00.0.00..000.0..000..000.0.0.0.00.00.0..0", ".000.....000.0..0000...0..0..00000.0....00..00....00.0000.", "...0..0.0.0.....0.....0.....0.0.0.00........0.....0...0.0."]
    assert_equal expected , @nightreader.lines
  end
end