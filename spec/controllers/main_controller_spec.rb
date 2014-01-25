require 'spec_helper'

describe MainController do

	describe "GET #index" do
		it "responds successfully with a HTTP 200 status code" do

			get :index
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "properly assigns T stations to instance variables for each of the 4 lines" do
			station1, station2, station3, station4 = Station.create(line: 'red'), Station.create(line: 'orange'),Station.create(line: 'green'),Station.create(line: 'blue')

			get :index
			expect(assigns(:red_line_stations)).to eq([station1])
			expect(assigns(:orange_line_stations)).to eq([station2])
			expect(assigns(:green_line_stations)).to eq([station3])
			expect(assigns(:blue_line_stations)).to eq([station4])
		end
	end

	describe "GET #show" do
		it "responds successfully with a HTTP 200 status code" do

			get :show
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the show template" do
			get :show
			expect(response).to render_template("show")
		end

	end

end
