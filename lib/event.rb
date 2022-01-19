require 'pry'

class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(foodtruck)
    @food_trucks << foodtruck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    items_with_truck = items_array.each_with_object({}) do |items,hash|
      hash[items] = @food_trucks.select { |food_truck| food_truck.inventory.include?(items) }
    end
    s = items_with_truck.each_with_object([]) do |(key,value), array|
      array << value if key.name == item
    end.flatten
  end

  def food_trucks_that_sell_by_item_object(item)
    @food_trucks.select { |food_truck| food_truck.inventory.include?(item) }
  end

  def total_inventory
    items_array.each_with_object({}) do |item,hash|
      hash[item] = {
        quantity: item_quantity_in_food_trucks(item),
        food_trucks: food_trucks_that_sell_by_item_object(item)
      }
    end
  end

  def item_quantity_in_food_trucks(item)
    food_trucks = food_trucks_that_sell_by_item_object(item)
    food_trucks.sum do |food_truck|
      food_truck.inventory[item]
    end
  end

  def items_array
    all_items_array = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        all_items_array << item
      end
    end
    items = all_items_array.uniq
  end


  def overstocked_items
    total_inventory.each_with_object([]) do |(item,value), array|
      array << item if value[:quantity] > 50 && value[:food_trucks].size > 1
    end
  end

  def sorted_item_list
    item_names = items_array.map do |item|
      item.name
    end
    item_names.sort
  end
end
