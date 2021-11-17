class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
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
    @food_trucks.map do |food_truck|
      food_truck.in_stock.map {|item| item.name}.uniq
    end.flatten.sort
  end

  def overstocked_items
    @food_trucks.map
  end
end
