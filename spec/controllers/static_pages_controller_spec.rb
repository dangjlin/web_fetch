require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET tree" do
    it "returns http success" do
      get :tree
      expect(response).to be_success
    end
  end

end
