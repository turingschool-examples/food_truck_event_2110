require 'date'

class Event
 	attr_reader :name,
              :food_trucks

 	def initialize(name)
 		@name = name
    @food_trucks = []
 	end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def for_sale_items
    @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def total_inventory
    inventory = {}
    for_sale_items.map do |item|
      inventory[item] = {quantity: food_trucks_that_sell(item).sum {|truck| truck.inventory[item]},
                 food_trucks: food_trucks_that_sell(item)}

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
    for_sale_items.map {|item| item.name}.sort
 end
end
