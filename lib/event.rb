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
    names = []

    @food_trucks.each do |truck|
      names << truck.name
    end

    names
  end

  def food_trucks_that_sell(item)
    vendors = []

    @food_trucks.each do |truck|
      inv = truck.inventory.keys
      item_names = []

      inv.each do |i|
        item_names << i.name
      end

      if item_names.include?(item.name)
        vendors << truck
      end
    end

    vendors
  end

  def sorted_item_list
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each_pair do |item, quantity|
        if !items.include?(item.name)
          items << item.name
        end
      end
    end
    items = items.sort()
    items
  end

end
