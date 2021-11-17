require 'date'
class Event
  attr_reader :name,
              :food_trucks,
              :date
  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
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

  def sorted_item_list
    @food_trucks.map do |truck|
      truck.inventory.map do |item, quant|
        item.name
      end
    end.flatten.sort.uniq
  end

  def overstocked_items
    overstock = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        if quant > 50 && food_trucks_that_sell(item).count > 1
          overstock << item
          end
        end
      end
    overstock
  end

  def total_inventory
    total_inventory_hash = Hash.new(0)
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quant|
        if total_inventory_hash.include?(item) == false
          total_inventory_hash[item] = {:quantity => 0, :food_trucks => food_trucks_that_sell(item)}
          total_inventory_hash[item][:quantity] += quant
        else total_inventory_hash[item][:quantity] += quant
        end
      end
    end
    total_inventory_hash
  end

end