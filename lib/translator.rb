class Translator
  attr_reader :library
  
  def initialize
    @library = Hash.new(0)
  end

  def populate
    @library['a'] = '0./n', '00/n', '..'
    @library['b'] = '0./n', '0./n', '..'
    @library['c'] = '00/n', '../n', '..'
    @library['d'] = '00/n', '.0/n', '..'
    @library['e'] = '0./n', '.0/n', '..'
    @library['g'] = '00/n', '00/n', '..'
    @library['h'] = '0./n', '00/n', '..'
    @library['i'] = '.0/n', '0./n', '..'
    @library['j'] = '.0/n', '00/n', '..'
    @library['k'] = '0./n', '../n', '0.'
    @library['l'] = '0./n', '0./n', '0.'
    @library['m'] = '00/n', '../n', '0.'
    @library['n'] = '00/n', '.0/n', '0.'
    @library['o'] = '0./n', '.0/n', '0.'
    @library['p'] = '00/n', '0./n', '0.'
    @library['q'] = '00/n', '00/n', '0.'
    @library['r'] = '0./n', '00/n', '0.'
    @library['s'] = '.0/n', '0./n', '0.'
    @library['t'] = '.0/n', '00/n', '0.'
    @library['u'] = '0./n', '../n', '00'
    @library['v'] = '0./n', '0./n', '00'
    @library['x'] = '00/n', '../n', '00'
    @library['y'] = '00/n', '.0/n', '00'
    @library['z'] = '0./n', '.0/n', '00'
  end
end



  # def translate_character(character)
  #   case character
  #   when ('a')         then charcter.tr('a', '0./n','00/n','..')
  #   end
  # end