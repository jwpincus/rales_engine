require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      id = Fabricate(:item).id
      get :show, params: {id: id}
      expect(response).to have_http_status(:success)
    end
  end

end
