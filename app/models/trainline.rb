class Trainline
  COLORS  = %w(red orange green blue)
  NB      = %w(Alewife Oak_Grove Lechmere Wonderland)
  SB      = %w(Ashmont/Braintree Forest_Hills Boston_College/Cleveland_Circle/Riverside/Heath_Street Bowdoin)

  attr_accessor :color, :stations, :nb_endpoint, :sb_endpoint

  def initialize(color, nb_endpoint, sb_endpoint)
    @color = color
    @stations = instance_variable_set("@#{color}_line_stations", Station.where(line: "#{color}"))
    @nb_endpoint = nb_endpoint
    @sb_endpoint = sb_endpoint
  end
end
