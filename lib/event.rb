require 'date'

class Event
  attr_reader :name,
              :food_trucks,
              :date

  def initialize(name)
    @name        = name
    @food_trucks = []
    @date        = Date.today.strftime("%d/%m/%Y")
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def items_for_sale
    @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def total_inventory
    inventory = {}
    items_for_sale.map do |item|
      inventory[item] = {quantity: food_trucks_that_sell(item).sum {|truck| truck.inventory[item]},
                 food_trucks: food_trucks_that_sell(item)}
                 #require "pry"; binding.pry
     end
     inventory
   end

   def overstocked_items
     overstocked_items = []
     total_inventory.each do |key, value|
       if value[:quantity] > 50 && value[:food_trucks].count >= 2
         overstocked_items.push(key)
       end
     end
     overstocked_items
   end

   def sorted_item_list
     items_for_sale.map do |item|
       item.name
     end.sort
   end

   def sell(item, quantity)
     if total_inventory.keys.include?(item) == false || total_inventory[item][:quantity] < quantity
       false
     else
       total_inventory[item][:quantity] -= quantity
       total_inventory[item][:food_trucks].map do |truck|
          if truck.inventory[item] > 0
            truck.inventory[item] -= quantity
          end 
        end
        true
       #require "pry"; binding.pry
     end
   end

end
