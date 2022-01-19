class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    food_trucks << food_truck
  end

  def food_truck_names
    food_trucks.map {|food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all { |food_truck| food_truck.inventory.include?(item) }
  end

  def item_sum_at_event(item)
    array_to_sum = []
    food_trucks.each do |food_truck|
      if food_truck.inventory.include?(item)
        food_truck.inventory.each do |stock_item, quantity|
          if item == stock_item then  array_to_sum << quantity
          end
        end
      end
    end
    array_to_sum.sum
  end

  def total_inventory
    hash = {}
    food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, inventory|
        sub_hash = {}
        if hash.has_key?(item) == false
          sub_hash[:quantity] = item_sum_at_event(item)
          sub_hash[:food_trucks] = food_trucks_that_sell(item)
          hash[item] = sub_hash
        end
      end
    end
    hash
  end

  def overstocked_items
    overstocked_item = []
    food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if item_sum_at_event(item) > 50 == true and food_trucks_that_sell(item).count > 1 == true
          overstocked_item << item
        end
      end
    end
    overstocked_item.uniq
  end

  def sorted_item_list
    items = []
    food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        items << item.name
      end
    end
    items.uniq.sort
  end
end
