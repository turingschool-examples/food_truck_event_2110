require 'date'
class Event
  attr_reader :name, :food_trucks, :date
  attr_accessor

  def initialize(name)
    @name = name
    @food_trucks = []
    @total_inventory = Hash.new(0)
    @date = Time.now.strftime("%d/%m/20%y")
  end


  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    collector = []
    @food_trucks.each do |truck|
      collector << truck.name
    end
    return collector
  end

  def food_trucks_that_sell(item)
    collector = []
    @food_trucks.each do |truck|
      if truck.inventory.include?(item)
        collector << truck
      end
    end
    return collector
  end

  def total_inventory
    @collector = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if !@collector.include?(item)
          @collector << item
        end
      end
    end

    @collector.each do |indv_item|
      hash = Hash.new(0)
      hash[:quantity] = 0
      hash[:food_trucks] = []
      @food_trucks.each do |truck|
        truck.inventory.each do |item, amount|
          if item == indv_item
            hash[:food_trucks] << truck
            hash[:quantity] += amount
          end
        end
      end
      @total_inventory[indv_item] = hash
    end

    return @total_inventory
  end

  def overstocked_items
    collector = []
    total_inventory.each do |item, info|
      if info[:quantity] >= 100
        collector << item
      end
    end
    return collector
  end

  def sorted_item_list
    name_collector = []
    @collector.each do |item|
      name_collector << item.name
    end
    return name_collector.sort
  end

  def sell(item, amount)
    total_inventory.each do |item, info|
      if info[:quantity] < amount
        return false
      end
    end
  end

end
