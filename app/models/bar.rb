class Bar
  attr_accessor :name, :address, :rating

  def initialize(hash)
    @name = hash['name']
    @address = hash['location']['display_address'].split.join(', ')
    @rating = hash['rating']
  end
end
