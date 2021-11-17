require 'date'
class Event
  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
  end

  def add_food_truck(new_food_truck)
    @food_trucks.push(new_food_truck)
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(select_item)
    @food_trucks.find_all { |truck| truck.inventory.include?(select_item) }
  end

  def item_list
    @food_trucks.flat_map { |truck| truck.inventory.keys }.uniq
  end

  def total_inventory
    item_hash = {}
    item_list.each do |item|
      food_trucks_that_sell(item).each do |truck|
        item_hash[item] ||= {quantity: 0, food_trucks: []}
        item_hash[item][:quantity] += truck.check_stock(item)
        item_hash[item][:food_trucks].push(truck) 
      end
    end
    item_hash
  end

  def overstocked_items
    overstock = total_inventory.each_with_object([]) do |(item, values), array|
      array.push(item) if values[:quantity] > 50 && values[:food_trucks].size > 1
    end
  end

  def sorted_item_list
    item_list.map(&:name).sort
  end

  def sell(select_item, quantity)
    return false unless total_inventory.key?(select_item)
    return false unless total_inventory[select_item][:quantity] >= quantity
    total_inventory[select_item][:food_trucks].each do |truck|
      if truck.check_stock(select_item) >= quantity
        truck.inventory[select_item] -= quantity 
      else
        quantity -= truck.inventory[select_item]
        truck.inventory[select_item] = 0
      end
    end
    return true
  end
end