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

  def total_inventory
    inner_hash_keys.reduce({}) do |key, item|
      key[item] = Hash.new(0)
      key[item][:quantity] = total_amount_of_item(item)
      key[item][:food_trucks]  = food_trucks_that_sell(item)
      key
    end
  end

  def inner_hash_keys
    keys = []
    @food_trucks.each do |food_truck|
      keys << food_truck.inventory.keys
    end
    keys.flatten.uniq
  end

  def total_amount_of_item(item)
    @food_trucks.map do |food_truck|
      food_truck.inventory[item]
    end.sum
  end
end
