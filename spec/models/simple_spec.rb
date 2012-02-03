require 'spec_helper'

describe Simple do
  it "should be valid" do
    Simple.new.should be_valid
  end
end
