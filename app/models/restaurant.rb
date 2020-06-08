class Restaurant
  attr_reader :name,
              :address,
              :city,
              :zip

  def initialize(attributes)
    @name = attributes[:restaurants].first[:restaurant][:name]
    @address = attributes[:restaurants].first[:restaurant][:location][:address]
    @city = attributes[:restaurants].first[:restaurant][:location][:city]
    @zip = attributes[:restaurants].first[:restaurant][:location][:zipcode]
  end

end 
