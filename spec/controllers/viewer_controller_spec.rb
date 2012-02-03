require 'spec_helper'

describe ViewerController do

  describe "GET 'index'" do
    it "should be successful" do
      viewer_path("home")
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      #viewer_sub_path("iona-today",)
      response.should be_success
    end
  end

end
