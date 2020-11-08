require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/night_writer'

class NightWriterTest < Minitest::Test
  
  def setup
    @nightwriter = NightWriter.new
  end

  def test_it_exsist

    assert_instance_of NightWriter, @nightwriter
  end
end