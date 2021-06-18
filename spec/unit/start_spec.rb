require 'ws_change/commands/start'

RSpec.describe WsChange::Commands::Start do
  it "executes `start` command successfully" do
    output = StringIO.new
    file = nil
    options = {}
    command = WsChange::Commands::Start.new(file, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
