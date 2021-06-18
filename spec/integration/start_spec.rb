RSpec.describe "`ws_change start` command", type: :cli do
  it "executes `ws_change help start` command successfully" do
    output = `ws_change help start`
    expected_output = <<-OUT
Usage:
  ws_change start [FILE]

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
