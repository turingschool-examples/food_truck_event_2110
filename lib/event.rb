class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_trucks_names
    name_array = []
    @food_trucks.each do |truck|
      name_array << truck.name
    end
    name_array
  end

  def food_trucks_that_sell(item)
    vendor_array = []
    @food_trucks.each do |truck|
      if truck.check_stock(item) > 0
        # binding.pry
        vendor_array << truck
      end
    end
    vendor_array
  end
end
