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
    @food_trucks.map { |truck| truck.name  }
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all { |truck| truck.inventory.include?(item)  }
  end

  def total_inventory
    total = 0
    food_inventory = Hash.new()
    foods = @food_trucks.flat_map { |truck| truck.inventory.keys}.uniq
    foods.each do |food|
      total = (food_trucks_that_sell(food).map { |truck| truck.inventory.values })
      require "pry"; binding.pry
      food_inventory[food] = {
        quantity: total[0].sum,
        # @food_trucks.each do |truck|
        #   if truck.inventory.include?(food)
        #     total += truck.inventory[food]
        #   end
        #   require "pry"; binding.pry
        # quantity = total,
        food_trucks: food_trucks_that_sell(food)

      }
      # end
      # @food_trucks.each do |truck|
      #   food_inventory[food].value = (food_trucks: food_trucks_that_sell(food))
      #
    end
  end
  def overstocked_items
    total_inventory.keys.find_all {|item| item.quantity > 51 }
  end
  def sorted_item_list
    foods = @food_trucks.flat_map { |truck| truck.inventory.keys}.uniq
    food_names = foods.map { |food| food.name }
    food_names.sort
  end
end
