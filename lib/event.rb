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
    truck_by_item = []
    @food_trucks.each do |food_truck|
      if food_truck.inventory.include? item
        truck_by_item << food_truck
      end
    end
    truck_by_item
  end

  def sorted_item_list
    alphabetical_items = @food_trucks.map do |food_truck|
      food_truck.inventory.map do |item|
        item[0].name
      end
    end
    alphabetical_items.flatten.uniq.sort
  end

  def overstocked_items
    #An item is overstocked if it is sold by more than 1
    #food truck AND the total quantity is greater than 50.
  end
end
