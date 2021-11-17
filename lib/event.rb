class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    food_truck_name_array = []
    @food_trucks.each do |truck|
      food_truck_name_array << truck.name
    end
    food_truck_name_array
  end

  def food_trucks_that_sell(item)
    trucks_that_sell_it = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        trucks_that_sell_it << truck
      end
    end
    trucks_that_sell_it
  end

  def sorted_items_list
    list_of_items_at_event = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        list_of_items_at_event << item.name
      end
    end
    list_of_items_at_event.uniq.sort
  end

  def total_inventory
    items_hash = {}
    items_at_event = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        items_at_event << item
      end
    end

    items_at_event.uniq.each do |item|
      items_hash[item] = {quantity: 0, food_trucks: []}
    end

    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        items_hash[item][:quantity] += amount
      end
    end

    items_hash.each do |item, sub_hash|
      food_trucks_that_sell(item).each do |truck|
        if truck.inventory.include?(item)
          sub_hash[:food_trucks] << truck
        end
      end
    end
    items_hash
  end

  def overstocked_items
    overstocked_items_list = []
    total_inventory.each do |key, value|
      if value[:quantity] >= 50 && value[:food_trucks].length >= 2
        overstocked_items_list << key
      end
    end
    overstocked_items_list
  end

end
