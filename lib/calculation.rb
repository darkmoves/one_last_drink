module Calculation

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

	end

end