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

  def food_trucks_that_sell(item_name)
    trucks_selling_item = []
    @food_trucks.each do |truck|
      if truck.check_stock(item_name) > 0
        trucks_selling_item << truck
      else
      end
    end
    trucks_selling_item
  end

  def keys
    all_items = []
    @food_trucks.each do |truck|
      all_items << truck.inventory.keys
    end
    keys = all_items.flatten.uniq
  end

  def total_quantity(item_name)
    total = 0
    @food_trucks.each do |truck|
      total += truck.check_stock(item_name)
    end
    total
  end

  def total_inventory
    keys.reduce({}) do |key, item_name|
      key[item_name] = {}
      require "pry"; binding.pry
      key[item_name][:quantity] = total_quantity(item_name)
      key[item_name][:food_trucks] = food_trucks_that_sell(item_name)
    end
  end
end
