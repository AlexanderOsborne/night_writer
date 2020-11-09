class Translator
  attr_reader :library
  
  def initialize
    @library = Hash.new('')
    populate_letters
  end

  def populate_letters
    @library['a'] = '0.', '..', '..'
    @library['b'] = '0.', '0.', '..'
    @library['c'] = '00', '..', '..'
    @library['d'] = '00', '.0', '..'
    @library['e'] = '0.', '.0', '..'
    @library['g'] = '00', '00', '..'
    @library['h'] = '0.', '00', '..'
    @library['i'] = '.0', '0.', '..'
    @library['j'] = '.0', '00', '..'
    @library['k'] = '0.', '..', '0.'
    @library['l'] = '0.', '0.', '0.'
    @library['m'] = '00', '..', '0.'
    @library['n'] = '00', '.0', '0.'
    @library['o'] = '0.', '.0', '0.'
    @library['p'] = '00', '0.', '0.'
    @library['q'] = '00', '00', '0.'
    @library['r'] = '0.', '00', '0.'
    @library['s'] = '.0', '0.', '0.'
    @library['t'] = '.0', '00', '0.'
    @library['u'] = '0.', '..', '00'
    @library['v'] = '0.', '0.', '00'
    @library['w'] = '.0', '00', '.0'
    @library['x'] = '00', '..', '00'
    @library['y'] = '00', '.0', '00'
    @library['z'] = '0.', '.0', '00'
    @library[" "] = '..', '..', '..'
  end
end
