require './lib/cli'

cli = CLI.new
cli.get_args

p cli.output
