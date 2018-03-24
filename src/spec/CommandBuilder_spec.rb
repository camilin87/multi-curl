require 'CommandBuilder'

describe CommandBuilder, 'command_from_url' do
  it 'returns nil by default' do
    expect(CommandBuilder.command_from_url(nil)).to be(nil)
  end
end