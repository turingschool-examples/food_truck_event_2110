class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def items_list #helper method for total_inventory
    @food_trucks.flat_map do |food_truck|
      food_truck.inventory.keys
    end.uniq
  end

  def total_qty_by_item #helper method for total_inventory
    collect_item_qty = Hash.new { |hash, key| hash[key] = 0 }
    @food_trucks.each do |food_truck|
      items_list.each do |item|
        collect_item_qty[item] += food_truck.check_stock(item)
      end
    end
    return collect_item_qty
  end

  def total_inventory
    data_by_item = {}
    items_list.each do |item|
      data_by_item[item] = {
        quantity: total_qty_by_item[item],
        food_trucks: food_trucks_that_sell(item)
      }
    end
    return data_by_item
  end

  def overstocked_items
    items_list.select do |item|
      if food_trucks_that_sell(item).length > 1 && total_qty_by_item[item] > 50
        true
      end
    end
  end

  def sorted_item_list
    a = items_list.map do |item|
      item.name
    end.sort
  end
end
