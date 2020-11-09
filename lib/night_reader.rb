require './lib/io'
require './lib/translator'

class NightReader
  attr_reader :io,
              :to_read,
              :to_write

  def initialize
    @io = IO.new
    @to_read = @io.to_read
    @to_write = @io.to_write
    @translator = Translator.new
  end
  def start
    @io.output
  end
end

nightreader = NightReader.new
p nightreader.start