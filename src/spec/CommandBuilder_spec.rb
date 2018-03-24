require 'CommandBuilder'

describe CommandBuilder, 'command_from_url' do
  def build(url)
    CommandBuilder.command_from_url(url)
  end

  it 'raises an error if no url provided' do
    expect { build(nil) }.to raise_error(RuntimeError)
    expect { build('') }.to raise_error(RuntimeError)
  end

  it 'command starts with the correct command' do
    expect(build('http://google.com')).to start_with('curl -s -o ')
  end

  it 'ends with the url' do
    expect(build('http://google.com')).to end_with(' -O http://google.com')
  end
end