# Controller for the page. Runs all the views.
class MainController < ApplicationController
  def index

    @trainlines = []

    for n in (0..3) do
      @trainlines << Trainline.new( Trainline::COLORS[n],
                                    Trainline::NB[n].gsub(/_/, ' '),
                                    Trainline::SB[n].gsub(/_/, ' ')
                                    )
    end
  end

  def show
    @station = Station.find(params[:id])
    direction = params[:direction]

    @bar = Bar.new(@station.find_bar)

    if Trip.valid?(@station, direction)
      @valid = true
      # Select the last train time using the last_train method
      # and direction variable, taken from the params hash.
      # Declare the current time in UTC to match the time zone
      # of the scheduled last trains.
      t_train = @station.last_train(direction)
      t_now = Chronic.parse("now")

      # Get the time remaining until the last train using the
      # time_comparison class method. Returns a 2 element hash
      # with hours, minutes.
      time = Trip.time_comparison(t_train, t_now)

      # Create the variable to display time using the elements
      # from the time hash. format_time  method adds a 0 before
      # single digit minutes for display.
      @time = Trip.format_time(time)

      # Use the time difference to pick a message to display.
      @message = Trip.find_message(@time, @bar)
      @next_time = @station.next_train(direction)
    else
      @valid = false
    end
  end
end
