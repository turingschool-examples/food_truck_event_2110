class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
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

  def total_inventory
    outside = Hash.new(0)
    inside = Hash.new(0)
    @food_trucks.each do |truck|
      truck.inventory.reduce(0) do |sum, (item, quantity)|
        # inside[:quantity] += quantity
        inside[:quantity] += truck.check_stock(item)
        inside[:food_trucks] = food_trucks_that_sell(item)
        outside[item] = inside
      end
    end
  end

  def overstocked_items
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if quantity > 50 && food_trucks_that_sell(item).size >= 2
          items << item
        end
      end
    end
    items
  end

  def sorted_item_list
    names = []
    @food_trucks.select do |truck|
      truck.inventory.select do |item, quantity|
        names << item.name
      end
    end
    names.uniq.sort
  end
end
