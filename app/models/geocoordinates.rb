class Geocoordinates
  attr_reader :latitude,
              :longitude

  def initialize(attributes)
    @latitude = attributes[:results].first[:geometry][:location][:lat]
    @longitude = attributes[:results].first[:geometry][:location][:lng]
  end
end
