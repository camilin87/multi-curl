require './lib/command_builder'
require './lib/command_runner'

urls_filename = ARGV[0]

p "Reading #{urls_filename}"

commands = CommandBuilder.from_file(urls_filename)

p "Found #{commands.count} urls"

CommandRunner.run(commands)

p "Done"
