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
    names = @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def total_inventory
    item_keys = @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
    inv = {}
    item_keys.map do |item|
      inv[item] = {
                    quantity: food_trucks_that_sell(item).sum {|truck| truck.inventory[item]},
                    food_trucks: food_trucks_that_sell(item)
                  }
    end
    inv
  end

  def overstocked_items
    items = total_inventory.select do |item, item_info|
      item if (item_info[:quantity] > 50) && (item_info[:food_trucks].length >= 2)
    end
    items.keys
  end

  def sorted_item_list
    items = []
    total_inventory.each_key do |key|
      items << key.name
    end
    items.sort
  end

  # def sell(item, qty)
  #   if total_inventory.keys.include?(item) == false || total_inventory[item][:quantity] <= qty
  #     return false
  #   elsif food_trucks_that_sell(item)[0].inventory[item] > 0
  #     food_trucks_that_sell(item)[0].inventory[item] -= qty until food_trucks_that_sell(item)[0].inventory[item] == 0
  #     return true
  #   elsif food_trucks_that_sell(item)[0].inventory[item] == 0
  #     food_trucks_that_sell(item)[1].inventory[item] -= qty
  #     return true
  #   end
  # end
end
