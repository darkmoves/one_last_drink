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

      @next_time = @station.next_train(direction)

      t_train = @station.last_train(direction)
      t_now = Chronic.parse("now")

      time = Trip.time_comparison(t_train, t_now)

      @time = Trip.format_time(time)

      @message = Trip.find_message(@time, @bar)
    else
      @valid = false
    end
  end
end
