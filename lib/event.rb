require 'date'

class Event

  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @date = Date.today.strftime("%d/%m/%Y")
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select {|truck| truck.inventory.has_key?(item)}
  end

  def total_inventory
    total_inventory = Hash.new{}
    @food_trucks.each do |truck|
      truck.inventory.each_pair do |item, qty|
        if !total_inventory.has_key?(item)
          total_inventory[item] = {quantity: qty, food_trucks: [truck]}
        else
          (total_inventory[item][:quantity] += qty) && (total_inventory[item][:food_trucks] << truck)
        end
      end
    end
  total_inventory
  end

  def overstocked_items
    overstocked_items = []
    total_inventory.each_pair do |item, data|
      overstocked_items << item if (data[:quantity] > 50) && (data[:food_trucks].count > 1)
    end
    overstocked_items
  end

  def sorted_item_list
    total_inventory.map {|item| item[0].name}.sort
  end

  def sell(item, qty)
    satisfied = nil; remaining_qty = qty
    total_inventory.each_pair do |inv_item, data|
      if (item == inv_item) && (data[:quantity] > qty)
        satisfied = true
        until remaining_qty == 0
          food_trucks_that_sell(item).each do |truck|
            if truck.inventory[item] >= remaining_qty
              (truck.inventory[item] -= remaining_qty) && (remaining_qty = 0)
            elsif truck.inventory[item] < remaining_qty
              (remaining_qty -= truck.inventory[item]) && (truck.inventory[item] = 0)
            end
          end
        end
        break
      else
        satisfied = false
      end
    end
    satisfied
  end
end
