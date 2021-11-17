class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = Array.new(0)
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def all_items
    items_array = @food_trucks.map do |truck|
      truck.inventory.keys.each do |key|
        key
      end
    end
    items_array.flatten.uniq
  end

  def item_hash(item)
    item_info_hash = Hash.new(0)

    item_info_hash[:quantity] = food_trucks_that_sell(item).sum do |truck|
      truck.inventory[item]
    end

    item_info_hash[:food_trucks] = food_trucks_that_sell(item)
    item_info_hash
  end

  def total_inventory
    total_inventory_hash = Hash.new(0)
    total_inventory_hash_keys = all_items
    total_inventory_hash_keys.each do |key|
      total_inventory_hash[key] = item_hash(key)
    end
    total_inventory_hash
  end

  def overstocked_items
    all_items.find_all do |item|
      food_trucks_that_sell(item).length > 1 && item_hash(item)[:quantity] > 50
    end
  end

  def sorted_item_list
    all_items.map do |item|
      item.name
    end.sort
  end

  def sell(item, quantity)
    flag = false
    if item_hash(item)[:quantity] >= quantity
      flag = true
      item_hash(item)[:food_trucks].map do |truck|
        if truck.inventory[item] >= quantity
          truck.inventory[item] -= quantity
        elsif truck.inventory[item] <= quantity
          truck.inventory[item] -= truck.inventory[item]
          quantity1 = quantity - truck.inventory[item]
        end
        quantity = quantity1
      end
    end
    flag
  end
end
