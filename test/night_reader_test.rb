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
end