require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  
  def setup
    @translator = Translator.new
  end

  def test_it_exsist_and_has_attributes
    
    expected = '0.', '..', '..'
    expected2 = '00', '00', '0.'
    expected3 = 'a'

    assert_instance_of Translator, @translator
    assert_equal expected, @translator.library['a']
    assert_equal expected2, @translator.library['q']
    assert_equal expected3, @translator.braille[['0.', '..', '..']]
  end

  def test_populate
    skip
  end
end