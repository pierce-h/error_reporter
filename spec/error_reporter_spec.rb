require "spec_helper"

RSpec.describe ErrorReporter do
  it "has a version number" do
    expect(ErrorReporter::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
