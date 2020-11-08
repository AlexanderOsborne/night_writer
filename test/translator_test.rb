require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  
  def setup
    @translator = Translator.new
  end

  def test_it_exsist_and_has_attributes
    expected = '0./n','00/n','..'
    expected2 = '00/n', '00/n', '0.'

    assert_instance_of Translator, @translator
    # assert_equal expected, @translator['a']
    # assert_equal expected2, @translator['q']
  end
end