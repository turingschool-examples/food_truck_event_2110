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
    @food_trucks.find_all do |truck|
      truck.inventory.include?(item)
    end
  end

  def sorted_item_list #returns list of names of all items FoodTrucks have in stock alphabetically

  end

  def item_list #plug into total_inventory
    @food_trucks.map do |truck|
      truck.inventory.map do |item, quantity|
        item
      end
    end.flatten
  end

  def total_qty_of_items(item) #plug into total_inventory
    @food_trucks.map do |truck|
      truck.inventory[item]
    end.sum
  end

  def items #plug into total_inventory
    item_list.uniq
  end

  def total_inventory
    items.reduce({}) do |hash, item|
      hash[item] = {} if !hash[item].is_a?(Hash)
      hash[item][:quantity] = total_qty_of_items(item)
      hash[item][:food_trucks] = food_trucks_that_sell(item)
      hash
    end
  end

  def overstocked_items
    overstocked = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if quantity > 50 && food_trucks_that_sell(item).count >= 2
          overstocked << item
        end
      end
    end
    overstocked
  end

  # def total_inventory #returns hash
  #   total_hash = Hash.new(0)
  #   sub_hash = Hash.new(0)
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, quantity|
  #       sub_hash[:quantity] += truck.check_stock(item)
  #       sub_hash[:food_trucks] = food_trucks_that_sell(item)
  #       total_hash[item] = sub_hash
  #     end
  #   end
  #   total_hash
  # end

end
