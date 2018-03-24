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

  def self.from_file(file_path)
    absolute_path = file_path

    urls = File.readlines(absolute_path).map { |l| l.tr("\r\n", '') }

    build(urls)
  end

  def self.build(urls)
    urls.map { |u| command_from_url u }
  end

  private

  def self.command_from_url(url)
    raise 'Missing url' if url.to_s.empty?

    uri = URI.parse(url)
    prefix = uri.path.tr('/.', '_').trim('_')

    "curl -s -o #{prefix}-$(date +%Y-%m-%d-%H-%M-%S).html -O #{url}"
  end
end