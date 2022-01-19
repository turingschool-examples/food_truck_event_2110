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
    name_array = []
    @food_trucks.each do |truck|
      name_array << truck.name
    end
    name_array
  end

  def food_trucks_that_sell(item)
    vendor_array = []
    @food_trucks.each do |truck|
      if truck.check_stock(item) > 0
        # binding.pry
        vendor_array << truck
      end
    end
    vendor_array
  end

  def total_inventory
    inventory_hash = Hash.new { |item, key| item[key] = 0 }

    inventory_array = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item|
        inventory_array << item
      end
    end
    new_hash = Hash.new { |hash, key| hash[key] = 0 }
    inventory_array.each do |item|
      new_hash[:quantity] += item[1]
      inventory_hash[item[0]] = new_hash
      #binding.pry
    end

    inventory_hash[:food_trucks] = []
    truck_hash = Hash.new { |hash, key| hash[key] = []}
    inventory_array.uniq.each do |item|
      @food_trucks.each do |truck|
        binding.pry
        if truck.check_stock(item) > 0
          truck_hash[:food_trucks].push(truck)
          inventory_hash[item[0]] = truck_hash
        end
      end
    end
    inventory_hash
  end
end
