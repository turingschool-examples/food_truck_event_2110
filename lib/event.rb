class Event
  attr_reader :name,
              :food_trucks
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
    @food_trucks.find_all do |truck|
      truck.check_stock(item) > 0
    end
  end

  def total_inventory
    total_inventory = {}
    all_items = @food_trucks.flat_map do |truck|
      truck.inventory.keys.uniq
    end
    all_items.each do |item|
      total_inventory[item] = {
        quantity: food_trucks_that_sell(item).sum {|truck| truck.check_stock(item)},
        food_trucks: food_trucks_that_sell(item)
      }
    end
    total_inventory
  end

  def overstocked_items
    # An item is overstocked if food trucks.length > 1  AND
    #  quantity > 50.
    overstocked_item = []
    total_inventory.each do |item, key|
      if key[:food_trucks].length > 1  &&  key[:quantity] > 50
        overstocked_item << item
      end
    end
    overstocked_item
  end
end
