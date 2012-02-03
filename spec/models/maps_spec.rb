require File.dirname(__FILE__) + '/../spec_helper'

describe Maps do
  it "should be valid" do
    Maps.new.should be_valid
  end
end
