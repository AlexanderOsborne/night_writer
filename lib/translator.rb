class Translator
  attr_reader :library
  
  def initialize
    @library = Hash.new(0)
  end

  def populate
    @library['a'] = '0./n','00/n','..'
    @library['b'] = '0./n', '0./n', '..'
  end

  def notreal
    puts "why can you read me?"
  end
end



  # def translate_character(character)
  #   case character
  #   when ('a')         then charcter.tr('a', '0./n','00/n','..')
  #   end
  # end