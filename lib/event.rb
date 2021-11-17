require './lib/food_truck'

class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all { |food_truck| food_truck.inventory[item] > 0 }
  end

  def items
    @food_trucks.flat_map { |food_truck| food_truck.inventory.keys }.uniq
  end

  def sorted_item_list
    self.items.map { |item| item.name }.sort
  end

  def total_inventory
    inventory = {}
    self.items.each do |item|
      inventory[item] = {
        quantity: @food_trucks.sum { |food_truck| food_truck.check_stock(item) },
        food_trucks: self.food_trucks_that_sell(item)
      }
    end
    inventory
  end

  def overstocked_items
    self.total_inventory.map do |item, item_data|
      item_data[:quantity] > 50 && item_data[:food_trucks].length > 1 ? item : nil
    end.compact
  end

end
