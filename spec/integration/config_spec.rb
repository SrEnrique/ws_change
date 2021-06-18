RSpec.describe "`ws_change config` command", type: :cli do
  it "executes `ws_change help config` command successfully" do
    output = `ws_change help config`
    expected_output = <<-OUT
Usage:
  ws_change config

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
