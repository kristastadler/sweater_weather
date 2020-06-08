class Restaurant
  attr_reader :name,
              :address

  def initialize(attributes)
    @name = attributes[:restaurants].first[:restaurant][:name]
    @address = [attributes[:restaurants].first[:restaurant][:location][:address], attributes[:restaurants].first[:restaurant][:location][:city], attributes[:restaurants].first[:restaurant][:location][:zipcode]].join(' ')
  end

end
