require './lib/command_builder'
require './lib/command_runner'

urls_filename = ARGV[0]

p "Reading #{urls_filename}"

urls = []

File.open(urls_filename).each_line do |url|
  urls << url
end

p "Found #{urls.count} urls"

commands = CommandBuilder.build(urls)
CommandRunner.run(commands)

p "Done"
