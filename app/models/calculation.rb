class Calculation

	def Calculation.time_comparison(t_train, t_now)
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

	def Calculation.format_time(time)
		if time[1] < 10
		 "#{time[0]}:0#{time[1]}"
		else
		 "#{time[0]}:#{time[1]}"
		end
	end

end