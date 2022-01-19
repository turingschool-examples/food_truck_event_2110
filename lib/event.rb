class Event
  attr_reader :name, :food_trucks, :food_truck_names
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    # binding.pry
    names = []
    @food_trucks.map do |food_truck|
      names << food_truck.name
    end
    names
  end

  def food_trucks_that_sell(food_item)
    trucks_that_sell = []
    @food_trucks.each do |food_truck|
      # binding.pry
      if @food_trucks.include?(food_item)
        trucks_that_sell << food_truck.name
      end
    end
    trucks_that_sell
    # if @food_truck.include?(food_item)
    #   trucks_that_sell << food_truck
    # end
    # trucks_that_sell
    # @food_truck.inventory.include?(food_item)
  end
end
