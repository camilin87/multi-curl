class CommandBuilder
  def self.command_from_url(url)
    raise 'Missing url' if url.to_s.empty?

    'curl'
  end
end