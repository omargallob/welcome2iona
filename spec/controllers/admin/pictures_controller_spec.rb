require 'spec_helper'

describe Admin::PicturesController do

  describe "GET 'crop'" do
    it "should be successful" do
      get 'crop'
      response.should be_success
    end
  end

end
