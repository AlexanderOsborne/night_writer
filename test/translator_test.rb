require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  
  def setup
    @translator = Translator.new
    @translator.populate
  end

  def test_it_exsist_and_has_attributes
    # require 'pry'; binding.pry
    expected = '0./n','00/n','..'
    expected2 = '00/n', '00/n', '0.'

    assert_instance_of Translator, @translator
    assert_equal expected, @translator.library['a']
    assert_equal expected2, @translator.library['q']
    # assert_equal '0./n','00/n','..', @translator.translate_character('a')
  end
end