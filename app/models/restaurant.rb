class Restaurant
  attr_reader :name,
              :address

  def initialize(attributes)
    @name = attributes[:restaurants].first[:restaurant][:name]
    @address = attributes[:restaurants].first[:restaurant][:location][:address]
  end

end
