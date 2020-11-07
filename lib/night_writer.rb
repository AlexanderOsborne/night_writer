require './lib/cli'

cli = CLI.new
cli.get_args
cli.create_file

p cli.output


