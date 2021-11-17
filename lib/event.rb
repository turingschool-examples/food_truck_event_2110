class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    food_trucks << truck
  end

  def food_truck_names
    food_trucks.flat_map(&:name)
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all do |truck|
      truck.inventory[item] > 0
    end
  end

  def sorted_item_list
    food_trucks.map do |truck|
      truck.inventory.each_with_object([]) do |(item, quantity), result|
        result << item.name if quantity > 0
      end
    end.flatten.uniq.sort
  end

  def total_quantity(item)
    food_trucks.map do |truck|
      truck.inventory[item]
    end.sum
  end

  def total_inventory
    food_trucks.each_with_object({}) do |truck, result|
      truck.menu_list.each do |item|
        result[item] = { quantity: total_quantity(item), food_trucks: food_trucks_that_sell(item) }
      end
    end
  end

  def overstocked_items
    total_inventory.each_with_object([]) do |(item, hash), results|
      results << item if hash[:quantity] > 50 && hash[:food_trucks].count > 1
    end
  end

  # def sell(item, qty)
  #   can_sell = total_inventory.any? do |the_item, hash|
  #     hash[:quantity] > qty && item == the_item
  #   end
  #   if can_sell == true
  #     require 'pry'
  #     binding.pry
  #     total_inventory[item][:food_trucks].each do |truck|
  #       # until qty == 0
  #       qty -= truck.inventory[item]
  #       truck.sell_item(item, qty)
  #     end
  #   end
  #   can_sell
  # end
end
