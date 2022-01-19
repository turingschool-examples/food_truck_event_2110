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

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) >= 1
    end
  end

  def total_stock(item)
    total = 0
    @food_trucks.each do |truck|
      total += truck.check_stock(item)
    end
    total
  end

  def overstocked_items
    overstock = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if total_stock(item) > 50 && food_trucks_that_sell(item).count >= 2
          overstock << item
        end
      end
    end
    overstock.uniq
  end
end
