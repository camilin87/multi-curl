require 'uri'
require 'pathname'

class String
  def trim(chars)
    self.chomp(chars)
        .reverse()
        .chomp(chars)
        .reverse()
  end
end

class CommandBuilder
  def self.command_from_url(url)
    raise 'Missing url' if url.to_s.empty?

    uri = URI.parse(url)
    prefix = uri.path.tr('/.', '_').trim('_')

    "curl -s -o #{prefix}-$(date +%Y-%m-%d-%H-%M-%S).html -O #{url}"
  end
end