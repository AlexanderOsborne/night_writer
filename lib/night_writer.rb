require './lib/io'
require './lib/translator'

class NightWriter
  attr_reader :io,
              :to_read,
              :to_write

  def initialize
    @io = IO.new
    @to_read = @io.to_read
    @to_write = @io.to_write
    @translator = Translator.new
  end

  def translate
    chars = @io.split_by_char
    chars.flat_map do |char|
      @translator.library[char]
    end
  end

  def start
    @io.copy
    p @io.output
  end
end

nightwriter = NightWriter.new
nightwriter.start
  
