class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.append(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def total_items
    @food_trucks.map do |truck|
      truck.inventory.keys
    end.flatten.uniq
  end

  def item_quant(item)
    @food_trucks.map do |truck|
      truck.inventory[item]
    end.sum
  end

  def item_details(item)
    hash = Hash.new(0)
    hash[:quantity] = item_quant(item)
    hash[:food_trucks] = food_trucks_that_sell(item)
    hash
  end
end
