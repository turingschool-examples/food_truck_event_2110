require 'date' 

class Event
  attr_reader :name, 
              :food_trucks

  def initialize(name)
    @name        = name 
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |truck| truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.map do |truck| 
      truck.inventory.map do |item1, quantity| 
        if item == item1 
          truck
        end
      end
    end.flatten.compact
  end

  def items_list 
    @food_trucks.map do |truck|
      truck.inventory.map do |item, quantity|
        item
      end
    end.flatten
  end

  def items
    items_list.uniq
  end

  def total_quantity_per_item(item)
    @food_trucks.map do |truck| 
      truck.inventory[item]
    end.sum
  end

  def total_inventory 
    items.reduce({}) do |hash, item|
      hash[item] = {} if !hash[item].is_a?(Hash)
      hash[item][:quantity] = total_quantity_per_item(item)
      hash[item][:food_trucks] = food_trucks_that_sell(item)
      hash
    end
  end

  def overstocked_items 
    items.find_all do |item|
      food_trucks_that_sell(item).count > 1 && total_quantity_per_item(item) > 50 
    end
  end

  def sorted_item_list
    items.map do |item|
      item.name
    end.sort
  end

  def date(date = Date.today)
    if date.class == Date
      date.strftime('%d-%m-%Y').gsub(/[-]/, "/")
    else 
      "#{date.slice(6..7)}/#{date.slice(4..5)}/#{date.slice(0..3)}"
    end 
  end

  def sell(item, quantity)
    return false if total_quantity_per_item(item) < quantity
      
    if total_quantity_per_item(item) > quantity
      total_inventory.map do |item1, values|
        values.map do |key, value|
          if item == item1 && value.is_a?(Array)
            value.map do |truck|
              truck.inventory[item] - quantity
            end
          end
        end
        total_inventory
      end
    end 
    true
  end
end