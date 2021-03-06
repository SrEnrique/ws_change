require 'ws_change/commands/config'

RSpec.describe WsChange::Commands::Config do
  it "executes `config` command successfully" do
    output = StringIO.new
    options = {}
    command = WsChange::Commands::Config.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
