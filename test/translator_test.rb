require 'simplecov'
SimpleCov.start
require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  
  def setup
    @translator = Translator.new
  end

  def test_it_exsist

    assert_instance_of Translator, @translator
  end

  def test_populate
    
    expected = '0.', '..', '..'
    expected2 = '00', '00', '0.'

    assert_equal expected, @translator.library['a']
    assert_equal expected2, @translator.library['q']
  end

  def test_braille

    expected3 = 'a'

    assert_equal expected3, @translator.braille[['0.', '..', '..']]
  end
end