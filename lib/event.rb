require 'pry'
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
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|truck| truck.check_stock(item) > 0}
  end

  def item_inventory(item)
    @food_trucks.reduce(0) {|accumulator, truck| accumulator += truck.check_stock(item)}
  end

  def total_inventory
    @food_trucks.reduce({}) do |acc, truck|
      truck.inventory.each do |item, amount|
        acc[item] = Hash.new(0)
        acc[item][:quantity] = item_inventory(item)
        acc[item][:food_trucks] = food_trucks_that_sell(item)
      end
    acc
    end
  end

  def overstocked_items
    overstocked = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if item_inventory(item) > 50 && food_trucks_that_sell(item).size > 1
          overstocked << item
        end
      end
    end
    overstocked.uniq
  end

  def item_list
    @food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def sorted_item_list
    item_names = item_list.map {|item| item.name}
    item_names.sort_by {|item| item[0]}
  end

end
