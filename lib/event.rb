require './lib/food_truck'

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
    @food_trucks.map{|food_truck| food_truck.name}.sort
  end

  def food_trucks_that_sell(item_name)
    @food_trucks.select{|food_truck| food_truck.check_stock(item_from_item_name(item_name)) > 0}.sort_by{|food_truck|food_truck.name}
  end

  def sorted_item_list
    @food_trucks.flat_map{|food_truck| food_truck.inventory_list}.uniq.sort
  end

  def sorted_items
    @food_trucks.flat_map{|food_truck| food_truck.inventory_items}.uniq.sort_by{|item| item.name}
  end

  def item_from_item_name(name)
    sorted_items.select{|item| item.name == name}[0]
  end

  def total_inventory
    sorted_item_list.each_with_object({}) do |item_name, total_inventory|
      item_hash = Hash.new(0)
      item = item_from_item_name(item_name)
      item_hash[:quantity] = food_trucks_that_sell(item_name).map{|food_truck| food_truck.check_stock(item)}.sum
      item_hash[:food_trucks] = food_trucks_that_sell(item_name)
      total_inventory[item] = item_hash
    end
  end

  def overstocked_items
    total_inventory.select{|item, sub_hash|sub_hash[:quantity] > 50 && sub_hash[:food_trucks].count > 1}.keys
  end

  def sell(item, quantity)
    return false if total_inventory[item][:quantity] < quantity
    total_inventory[item][:food_trucks].each do |food_truck|
      if quantity >= food_truck.check_stock(item)
        food_truck.inventory[item] = 0
        quantity -= food_truck.check_stock(item)
      else
        food_truck.inventory[item] -= quantity
        quantity = 0
      end
    end
    true
  end
end
