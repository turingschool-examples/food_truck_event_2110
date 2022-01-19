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
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def total_quantity(item)
    quantity = 0
    @food_trucks.each do |truck|
      truck.inventory.each do |truck_item, truck_amount|
        if truck_item == item
          quantity += truck_amount
        end
      end
    end
    quantity
  end

  def total_inventory
    @food_trucks.reduce({}) do |acc, truck|
      truck.inventory.each do |item, amount|
        inventory_counter = 0
        acc[item] = Hash.new(0)
        acc[item][:quantity] += truck.inventory[item]
        acc[item][:food_trucks] = food_trucks_that_sell(item)
      end
    acc
    end
  end
end
