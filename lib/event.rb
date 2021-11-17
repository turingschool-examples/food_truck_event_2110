class Event
  attr_accessor :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map { |t| t.name }
  end

  def food_trucks_that_sell(item)
    trucks_with_item = []
    @food_trucks.each do |t|
      truck_inventory = t.inventory.keys
      truck_inventory.each do |i|
        if i.name == item.name
          trucks_with_item << t
        end

      end
    end
    trucks_with_item
  end

  def sorted_item_list
    item_names = []
    @food_trucks.each do |t|
      truck_inventory = t.inventory.keys
      truck_inventory.each do |i|
        item_names << i.name
      end
    end
    item_names.sort.uniq
  end

end
