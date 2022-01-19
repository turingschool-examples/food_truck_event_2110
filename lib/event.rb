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
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |truck|
      truck.inventory.keys.include?(item)
    end
  end

  def total_quantity(item)
    quantity = 0
    @food_trucks.each do |truck|
      truck.inventory.each do |truck_item, truck_amount|
        if truck_item == item
          quantity += truck_amount
        end
      end
    end
    quantity
  end

  def total_inventory
    @food_trucks.reduce({}) do |acc, truck|
      truck.inventory.each do |item, amount|
        acc[item] = Hash.new(0)
        acc[item][:quantity] = total_quantity(item)
        acc[item][:food_trucks] = food_trucks_that_sell(item)
      end
    acc
    end
  end

  def overstocked_items
    overstocked = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        if total_quantity(item) > 50 && food_trucks_that_sell(item).size > 1
          overstocked << item
        end
      end
    end
    overstocked.uniq
  end

  def item_list
    @food_trucks.flat_map do |truck|
      truck.inventory.keys
    end.uniq
  end

  def sorted_item_list
    item_names = item_list.map {|item| item.name}
    item_names.sort_by {|item| item[0]}
  end

  def date
    Date.today.strftime("%d/%m/%Y")
  end

  def sell(item, quantity)
    return false if total_quantity(item) < quantity
    @food_trucks.each do |truck|
      truck.inventory.keys.include?(item)
      if truck.inventory[item] > quantity
        truck.inventory[item] -= quantity
      else
        quantity -= truck.inventory[item]
        truck.inventory[item] = 0
      end
    end
  true
  end
end
