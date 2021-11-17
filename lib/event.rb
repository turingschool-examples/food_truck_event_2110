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

  def total_inventory
    all_inventory = Hash.new(0)
    @food_trucks.each do |t|
      truck_items = t.inventory
      truck_items.each do |item, count|
        all_inventory[item] += count

      end
    end
    all_inventory_with_trucks = Hash.new
    all_inventory.each do |item|
      all_inventory_with_trucks[item[0]] = {
        quantity: item[1],
        food_trucks: food_trucks_that_sell(item[0])
      }
    end
    all_inventory_with_trucks
  end

  def overstocked_items
    overstocked = total_inventory.select do |item, info|
      info[:quantity] > 50 && info[:food_trucks].length > 1
    end
    overstocked.keys
  end


end
