class Event
  attr_reader :name, :food_trucks
  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.include?(item)
    end
  end

  def sorted_item_list
    sorted_list = []
    @food_trucks.each do |truck|
      truck.inventory.select do |item|
        sorted_list.push(item.name)
      end
    end
    sorted_list.uniq.sort
  end

  def overstocked_items
    overstock = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if quantity > 50 && food_trucks_that_sell(item).count >= 2
          overstock.push(item)
        end
      end
    end
    overstock
  end
end
