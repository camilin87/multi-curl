require './lib/command_builder'
require './lib/command_runner'

urls_filename = ARGV[0]
output_dir = ARGV[1]

raise "Output Directory does not exist! \"#{output_dir}\"" unless File.exists?(output_dir)

p "Output Directory: #{output_dir}"
p "Reading: #{urls_filename}"

commands = CommandBuilder.from_file(urls_filename, output_dir)

p "Found #{commands.count} urls"

CommandRunner.run(commands)

p "Done"
