require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/translator'

class TranslatorTest < Minitest::Test
  
  def setup
    @translator = Translator.new
    # populate_translator(@translator)
  end

  def test_it_exsist_and_has_attributes
    require 'pry'; binding.pry
    assert_instance_of Translator, @translator
    assert_equal '0./n','00/n','..', @translator["a"]
  end
end