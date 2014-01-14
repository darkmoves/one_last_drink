class Trip < ActiveRecord::Base

	def Trip.valid?(station, direction)
		if (station.nb_endpoint && direction == 'nb') || (station.sb_endpoint && direction == 'sb')
			false
		else
			true
		end
	end

end
