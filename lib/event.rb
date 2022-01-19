class Event
  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%y")
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
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) >= 1
    end
  end

  def total_stock(item)
    total = 0
    @food_trucks.each do |truck|
      total += truck.check_stock(item)
    end
    total
  end

  def overstocked_items
    overstock = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        if total_stock(item) > 50 && food_trucks_that_sell(item).count >= 2
          overstock << item
        end
      end
    end
    overstock.uniq
  end

  def sorted_item_list
    item_names = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        item_names << item.name
      end
    end
    item_names.uniq.sort
  end

  def list_items
    items = []
    @food_trucks.each do |truck|
      truck.inventory.each do |item, quantity|
        items << item
      end
    end
    items
  end

  def total_inventory
    inventory_hash = Hash.new(0)
    list_items.each do |item|
      item_hash = Hash.new(0)
      inventory_hash[item] = item_hash
      item_hash[:quantity] = total_stock(item)
      item_hash[:food_trucks] = food_trucks_that_sell(item)
    end
    inventory_hash
  end



end
