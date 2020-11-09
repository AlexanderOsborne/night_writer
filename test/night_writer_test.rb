require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/night_writer'
require './lib/io'
require './lib/translator'

class NightWriterTest < Minitest::Test
  
  def setup
    @nightwriter = NightWriter.new
    ARGV.replace(['message.txt','braille.txt'])
  end

  def test_it_exsist

    assert_instance_of NightWriter, @nightwriter
    assert_instance_of IO, @nightwriter.io
  end

  def test_translate
    skip
    expected = ".000..000..0..0.0.0.0....00.0.00.0\n0......0.000...0.000.0..00.000.00.\n..0...0.0.0...00..0.0....00.0...0."

    assert_equal expected, @nightwriter.translate
  end


  def test_by_line
    skip
    expected = 0
  assert_equal expected, @nightwriter.by_line("message.txt")
  end
end