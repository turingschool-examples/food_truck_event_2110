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
    @food_trucks.map {|food_truck| food_truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all {|food_truck| food_truck.inventory.keys.include?(item) == true}
  end

  def total_inventory
    items = @food_trucks.map {|food_truck| food_truck.inventory.keys}.flatten.uniq
    quantities = items.map do |item|
      @food_trucks.each do |food_truck|
        food_truck.check_stock(item)
      end
    end.sum
    require "pry"; binding.pry
    food_trucks = items.map {|item| food_trucks_that_sell(item)}
    quantities = @food_trucks.map {|food_truck| food_truck.inventory}
    food_trucks_by_item = Hash[items.zip(food_trucks)]
    formatted_hash = Hash.new(0)
    food_trucks_by_item.keys.map {|item| formatted_hash[item] = {quantity: 0, food_trucks: []}}
    formatted_hash.values.each do |value|
      food_trucks_by_item.values.each do |array|
        value[:food_trucks] = array
      end
    end
    formatted_hash.values.each do |value|
      quantities.each do |quantity|
        value[:quantity] = quantity
      end
    end
    formatted_hash
  end

  def overstocked_items
    overstocked = []
    items = @food_trucks.map do |food_truck|
      food_truck.inventory.keys
    end.flatten
    duplicate_items = items.select {|item| items.count(item) > 1}
    quantities = duplicate_items.uniq.map do |item|
      @food_trucks.map do |food_truck|
        food_truck.check_stock(item)
      end.sum
    end
    item_quantity_hash = Hash[quantities.zip(duplicate_items.uniq)]
    item_quantity_hash.select do |quantity, item|
      if quantity >= 50
        overstocked << item
      end
    end
    overstocked
  end

  def sorted_item_list
    items = @food_trucks.map {|food_truck| food_truck.inventory.keys}.flatten.uniq
    items.map {|item| item.name}.sort
  end
end
