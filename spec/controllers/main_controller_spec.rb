require 'spec_helper'

describe MainController do

	describe "GET #index" do
		it "responds successfully with a HTTP 200 status code" do

			get :index
			expect(response).to be_success
			expect(response.status).to eq(200)
		end
	end

end
