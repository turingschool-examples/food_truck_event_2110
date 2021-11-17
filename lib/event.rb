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
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.include?(item)
    end
  end

  def total_inventory
    total = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, amount|
        if total[item].nil?
          total[item] = {quantity: amount, food_trucks: [food_truck]}
        else
          total[item][:quantity] += amount
          total[item][:food_trucks] << food_truck
        end
      end
    end
    total
  end

  def overstocked_items
    overstocked = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        if food_trucks_that_sell(item).length > 1 && quantity >50
          overstocked << item
        end
      end
    end
    overstocked
  end

  def sorted_item_list
    total_inventory.keys.map do |item|
     item.name
   end.sort
  end
end
