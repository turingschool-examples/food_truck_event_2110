class Event

 attr_reader :name, :food_trucks

 def initialize(name)
  @name = name
  @food_trucks = []
 end

 def add_food_truck(truck)
   @food_trucks << truck
 end

 def food_truck_names
  @food_trucks.map { |truck| truck.name}
 end

 def food_trucks_that_sell(item)
   trucks_that_sell = []
  @food_trucks.each do |truck|
    truck.inventory.select do |object|
    trucks_that_sell << truck if object.name == item.name
    end
    end
    return trucks_that_sell
  end

  def total_inventory
    inventory = Hash.new
    unique_items = @food_trucks.map do |truck|
      truck.inventory.flat_map {|object, quantity| object}
      end
    uniq_items = unique_items.flatten.uniq
    uniq_items.map { |item| inventory[item]}
    @food_trucks.each do |truck|
      truck.inventory.each do |object, quantity|
        if inventory.key?(object)
          inventory[item] = {[:quanity] => quanity,
                            [:food_trucks] => truck}

                            return inventory
  end
end
end
  end
end
