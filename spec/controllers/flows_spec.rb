require 'rails_helper'

RSpec.describe Api::V1::FlowsController, type: :controller do

    describe "GET #index" do
        it "returns json response" do
            get :index, :params => { :platform => "Github" }
            expect(response.content_type).to eq "application/json; charset=utf-8"
        end
    end

    describe "GET #flow_to" do
        it "returns http found" do
            get :flow_to, :params => { :platform => "Github" }
            expect(response).to have_http_status(:found)
        end
    end

    describe "GET #get_token" do
        it "returns json response" do
            get :flow_to, :params => { :platform => "Github" }
            expect(response).to have_http_status(:found)
        end
    end

end