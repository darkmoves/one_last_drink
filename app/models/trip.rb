class Trip < ActiveRecord::Base

	def Trip.valid?(station, direction)
		if (station.nb_endpoint && direction == 'nb') || (station.sb_endpoint && direction == 'sb')
			false
		else
			true
		end
	end

	def Trip.time_comparison(t_train, t_now)
		if (t_train.hour >= t_now.hour) & (t_train.min >= t_now.min)
			@hour = t_train.hour - t_now.hour
			@min = t_train.min - t_now.min
		elsif (t_train.hour >= t_now.hour) & (t_train.min < t_now.min)
			@hour = (t_train.hour - 1) - t_now.hour
			@min = (t_train.min + 60) - t_now.min
		elsif (t_train.hour < t_now.hour) & (t_train.min >= t_now.min)
			@hour = (t_train.hour + 24) - t_now.hour
			@min = t_train.min - t_now.min
		elsif (t_train.hour < t_now.hour) & (t_train.min < t_now.min)
			@hour = (t_train.hour + 23) - t_now.hour
			@min = (t_train.min + 60) - t_now.min
		else
			@hour = nil
			@min = nil
		end
		[@hour,@min]
	end

	def Trip.format_time(time)
		if time[1] < 10
		 ["#{time[0]}","0#{time[1]}"]
		else
		 ["#{time[0]}","#{time[1]}"]
		end
	end

	def Trip.find_message(time, name)
		if (20 <= time[0].to_i) && (time[0].to_i <= 24)
			"You missed the last train. I'll bet you could use a drink."
		elsif (1 <= time[0].to_i) && (time[0].to_i <= 20)
			"Plenty of time. Hit up #{name} for a few rounds."
		elsif (time[0].to_i == 0) && (15 < time[1].to_i) 
			"Ready for a quick round at #{name}?"
		elsif (time[0].to_i == 0) && (time[1].to_i <= 15)
			"Time to catch the train!"
		else
			nil
		end
	end

end
