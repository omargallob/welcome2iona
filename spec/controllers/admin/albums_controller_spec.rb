require 'spec_helper'

describe Admin::AlbumsController do

  describe "GET 'show'" do
    it "should be successful" do
      #get 'show', :id => Album.first
      response.should be_success
    end
  end

end
