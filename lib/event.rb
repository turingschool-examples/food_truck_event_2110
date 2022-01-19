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
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.inventory[item] != 0 }
  end

  def total_inventory
    inventory = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, qty|
        inventory[item] ||= {quantity: 0, food_trucks: []}
        inventory[item][:quantity] += qty
        inventory[item][:food_trucks] << food_truck
      end
    end
    inventory
  end

  def overstocked_items
    total_inventory.map do |item, info|
      item if info[:quantity] > 50 && info[:food_trucks].count > 1
    end.compact
  end

  def sorted_item_list
    total_inventory.map { |item, info| item.name }.sort
  end
end
