require 'spec_helper'

describe Station do
	it "has a name" do
		alewife = Station.create!(name: 'Alewife')

		expect(alewife.name).to eq('Alewife')
	end
end
