class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.inventory.has_key?(item) }
  end

  def items
    @food_trucks.map do |truck|
      truck.items
    end.flatten.uniq
  end

  def sorted_items_list
    @food_trucks.map do |truck|
      truck.items.map(&:name)
    end.flatten.uniq.sort
  end

  def total_quantity(item)
    count = 0
    @food_trucks.each do |truck|
      truck.inventory.each do |inv_item, quantity|
        count += quantity if inv_item == item
      end
    end
    count
  end

  def total_inventory
    sub_hash = {
      quantity: 0,
      food_trucks: []
    }
    hash = {}

    items.each do |item|
      sub_hash[:food_trucks] << food_trucks_that_sell(item)
      sub_hash[:quantity] = total_quantity(item)
      hash[item] = sub_hash.dup
    end
    hash
  end

  def overstocked_items
    os = total_inventory.select do |item, info|
      info[:quantity] > 50 && info[:food_trucks].count > 1
    end
    os.keys
  end
end
