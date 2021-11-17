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

end
