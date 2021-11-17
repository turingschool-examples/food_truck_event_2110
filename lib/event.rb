class Event
  attr_reader :name, :food_trucks, :date
  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def total_inventory
    hash_1 = {}
    @food_trucks.map do |truck|
      truck.inventory.keys.flatten.uniq.map do |item|
        hash_1[item] = {food_trucks: food_trucks_that_sell(item),
          quantity: food_trucks_that_sell(item).sum {|truck| truck.check_stock(item)}}
      end
    end
    hash_1
  end

  def overstocked_items
    total_inventory.keys.select do |key|
      food_trucks_that_sell(key).length > 1 &&
      food_trucks_that_sell(key).sum {|truck| truck.check_stock(key)} > 50
    end
  end

  def sorted_item_list
    names = total_inventory.keys.map {|key| key.name}
    names.sort
  end
end
