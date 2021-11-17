require 'date'

class Event
  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime('%d/%m/%Y')
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|food_truck| food_truck.check_stock(item) > 0}
  end

  def total_inventory
    items = @food_trucks.map {|food_truck| food_truck.in_stock}.flatten.uniq
    total_inventory = {}

    items.each do |item|
      total_inventory[item] = {
        quantity: @food_trucks.sum {|food_truck| food_truck.check_stock(item)},
        food_trucks: food_trucks_that_sell(item)
      }
    end
    total_inventory
  end

  def sorted_item_list
    total_inventory.keys.map {|item| item.name}.sort
  end

  def overstocked_items
    overstock = total_inventory.select do |item, stock_trucks|
      item if stock_trucks[:quantity] > 50 && stock_trucks[:food_trucks].length > 1
    end
    overstock.keys
  end

  # def sell(item, quantity)
  #   require 'pry'; binding.pry
  #   sell_quantity = quantity
  #   if total_inventory[item][:quantity] > quantity
  #     false
  #   else
  #     @food_trucks.each do |food_truck|
  #       food_truck.sell(item, sell_quantity)
  #       sell_quantity -=
  #     end
  #   end
  # end
end
