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

  def test_start
    
    expected = "Created braille.txt" + " containing 17 characters"
    
    assert_equal expected, @nightwriter.start
  end

  def test_translate
    expected = [".0/n", "0./n", "..", "00/n", "../n", "0.", "../n", "../n", "..", "00/n", ".0/n", "0.", "0./n", ".0/n", "0.", ".0/n", "00/n", "0.", "../n", "../n", "..", "0./n", ".0/n", "00", "0./n", ".0/n", "..", "0./n", "00/n", "0.", "0./n", ".0/n", "0.", "../n", "../n", "..", "", "0./n", ".0/n", "0.", "0./n", "00/n", "0.", "00/n", ".0/n", "..", ".0/n", "0./n", "0."]

    assert_equal expected, @nightwriter.translate
  end
end