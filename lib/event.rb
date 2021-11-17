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
    names = @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks = []
    @food_trucks.each do |truck|
      truck.inventory.each do |food|
        if food[0].name == item.name
          trucks << truck
        end
      end
    end
    trucks
  end



  def total_inventory
    hash = {}
    hash_1 = {}
    hash_1[:quantity] = 0
    hash_1[:food_trucks] = []
    inventory = @food_trucks.flat_map { |truck| truck.inventory.keys }.uniq
    inventory.each do |item|
      count = 0
      food_trucks_that_sell(item).each do |truck|
        truck.inventory.each do |food|
          if food[0].name == item.name
            count += food[1]
          end
          hash_1[:quantity] = 7
        end
        hash_1[:food_trucks] = food_trucks_that_sell(item)
        hash[item] = hash_1
        # require 'pry'; binding.pry
      end

    end
    hash
    # require 'pry'; binding.pry
  end

  def overstocked_items

  end

  def sorted_item_list
    list = @food_trucks.flat_map do |truck|
      truck.inventory.map do |item|
        item[0].name
      end
    end.sort.uniq
  end

end
