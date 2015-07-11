require "spec_helper"

RSpec.describe Dragon::VERSION do
  it "should be a string" do
    expect(Dragon::VERSION).to be_kind_of(String)
  end
end
