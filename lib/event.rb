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

  def food_trucks_that_sell(item_name)
    trucks_selling_item = []
    @food_trucks.each do |truck|
      if truck.check_stock(item_name) > 0
        trucks_selling_item << truck
      else
      end
    end
    trucks_selling_item
  end

  def total_inventory
    inner_hash_keys.reduce({}) do |key, item|
      key[item] = Hash.new(0)
      key[item][:quantity] = total_amount_of_item(item)
      key[item][:food_trucks]  = food_trucks_that_sell(item)
      key
    end
  end

  def inner_hash_keys
    keys = []
    @food_trucks.each do |truck|
      keys << truck.inventory.keys
    end
    keys.flatten.uniq
  end

  def total_amount_of_item(item_name)
    @food_trucks.map do |truck|
      truck.inventory[item_name]
    end.sum
  end

  def overstocked_items
    overstocked_item_names = []
    @food_trucks.each do |truck|
      truck.inventory.map do |item_name, quantity|
        if total_amount_of_item(item_name) > 50
          overstocked_item_names << item_name
        end
      end
    end
    overstocked_item_names.uniq
  end

  def sorted_item_list
    alphabetical_item_list = []
    @food_trucks.each do |truck|
      truck.inventory.map do |item, quantity|
        alphabetical_item_list << item.name
      end
    end
    alphabetical_item_list.uniq.sort
  end

  def date
    todays_date = Time.now.strftime("%m/%d/%Y")
  end
end
