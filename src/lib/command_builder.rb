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

  def self.from_file(file_path, output_dir)
    absolute_path = file_path

    urls = File.readlines(absolute_path).map { |l| l.tr("\r\n", '') }

    build(urls, output_dir)
  end

  def self.build(urls, output_dir)
    urls.map { |u| command_from_url(u, output_dir) }
  end

  private

  def self.command_from_url(url, output_dir)
    raise 'Missing url' if url.to_s.empty?

    uri = URI.parse(url)
    prefix = uri.path.tr('/.', '_').trim('_')

    output_filename = "#{prefix}-$(date +%Y-%m-%d-%H-%M-%S).html"
    output_path = File.join(output_dir, output_filename)

    "curl -s -o #{output_path} -O #{url}"
  end
end