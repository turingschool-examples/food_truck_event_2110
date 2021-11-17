class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item_name)
    trucks_selling_item = []
    @food_trucks.each do |truck|
      if truck.check_stock(item_name) > 0
        trucks_selling_item << truck
      else
      end
    end
    trucks_selling_item
  end
end
