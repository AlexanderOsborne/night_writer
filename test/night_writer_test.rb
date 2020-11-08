require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  
  def setup
    @nightwriter = NightWriter.new
    ARGV.replace(['message.txt','braille.txt'])
  end

  def test_it_exsist

    assert_instance_of NightWriter, @nightwriter
  end

  def test_start
    start
    
    assert_instance_of IO, io
  end
end