class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    total_inventory = Hash.new{|h, k| h[k] = Hash.new(0)}

    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        item_hash = Hash.new(0)
        item_hash[:quantity] = quantity
        item_hash[:food_trucks] = food_trucks_that_sell(item)
        total_inventory[item][:quantity] += item_hash[:quantity]
        total_inventory[item][:food_trucks] = item_hash[:food_trucks]
      end
    end
    total_inventory
  end

  def overstocked_items
    overstocked = total_inventory.select do |item, values|
      values[:quantity] > 50 && values[:food_trucks].length > 1
    end
    overstocked.keys
  end

  def sorted_item_list
    list = total_inventory.map do |item, values|
      item.name
    end
    list.sort
  end

  def sell(item, quantity)
    total_hash = total_inventory
    item_hash = total_hash[item]
    if quantity > item_hash[:quantity]
      return false
    elsif quantity <= item_hash[:quantity]
      # remove item from inventory - start with first food truck

      return true
    end

  end



end
