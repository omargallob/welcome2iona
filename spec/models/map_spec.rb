require File.dirname(__FILE__) + '/../spec_helper'

describe Map do
  it "should be valid" do
    Map.new.should be_valid
  end
end
