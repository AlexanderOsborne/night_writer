require './lib/file_io'
require './lib/translator'

class NightWriter
  
  def initialize
    
    start
  end

  def translate
      
  end

  def start
    require 'pry'; binding.pry
    io = IO.new
    io.copy
    puts io.output
  end
end
  
  

  
 
