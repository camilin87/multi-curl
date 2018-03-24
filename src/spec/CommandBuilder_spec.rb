require 'CommandBuilder'

describe CommandBuilder, 'command_from_url' do
  it 'raises an error if no url provided' do
    expect { CommandBuilder.command_from_url(nil) }.to raise_error(RuntimeError)
    expect { CommandBuilder.command_from_url('') }.to raise_error(RuntimeError)
  end
end