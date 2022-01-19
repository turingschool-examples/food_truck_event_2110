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
end
