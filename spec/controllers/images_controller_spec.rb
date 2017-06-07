require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
	describe "GET populate" do
		it "has a 200 status code" do
			get :populate
			expect(response.status).to eq(200)
		end
	end
	describe "GET show" do
		it "has a 200 status code" do
			get :show
			expect(response.status).to eq(200)
		end
	end	
end
