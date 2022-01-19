class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_trucks_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    trucks_per_item = @food_trucks.reduce([]) do |arr, truck|
      arr << truck if truck.inventory.key?(item)
      arr
    end
  end

  def item_hash
    items_hash = Hash.new({})
    @food_trucks.each do |truck|
      truck.inventory.keys.each do |key|
        items_hash[key] = {
          quantity: 0,
          food_trucks: []
        }
      end
    end
    items_hash
  end

  def total_inventory
    final_hash = item_hash
    item_hash.each_pair do |k, v|
      @food_trucks.each do |truck|
        if truck.inventory.key?(k)
          final_hash[k][:quantity] += truck.check_stock(k)
          final_hash[k][:food_trucks] << truck
        end
      end
    end
    final_hash
  end

  def overstocked_items
    overstocked = total_inventory.reduce([]) do |arr, item|
      if item[1][:quantity] > 50 && item[1][:food_trucks].length > 1
        arr << item[0]
      end
      arr
    end
    overstocked
  end

  def sorted_item_list
    obj_arr = total_inventory.keys.sort_by {|item| item.name}
    obj_arr.map {|item| item.name}
  end
end
