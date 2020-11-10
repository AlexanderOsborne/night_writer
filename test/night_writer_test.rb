require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/io'
require './lib/translator'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  
  def setup
    @nightwriter = NightWriter.new 'message.txt', 'braille.txt'
    @nightwriter.start
    @dummy = "dummy text for testing"
  end

  def test_it_exsist

    assert_instance_of NightWriter, @nightwriter
  end

  def test_translate
    
    @filecontents = @dummy
    @nightwriter.by_line(@filecontents)
    
    expected = nil
    
    assert_equal expected, @nightwriter.translate
  end


  def test_by_line
 
    expected = "000.000000...00.00.0..000.0....00..0.0.00000\n.0.......0..00.0..00..0..000..00.00.000..000\n..000.0.00..0...000.....0.0...0...0.0...0...\n"
  
  assert_equal expected, @nightwriter.by_line(@dummy)
  end

  def test_start
    
    @nightwriter.start
    
    expected = "Created braille.txt containing 70 characters"
    assert_equal expected, @nightwriter.start
  end
end