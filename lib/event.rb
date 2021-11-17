class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck_obj)
    @food_trucks << food_truck_obj
  end

  # Return all truck names as an array
  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  # Select trucks who's inventory has an existing
  # key of our given obj
  # Does not account for an empty quantity of said key
  def food_trucks_that_sell(item_obj)
    @food_trucks.select do |truck|
      truck.inventory.key?(item_obj)
    end
  end

  # Fat comment in the method below will probably remove
  # Also I know I can use =begin || =end, it just looks ugly
  def sorted_item_list
    # Go through each Truck in @food_trucks[]
    @food_trucks.map do |truck|
      # Go through each Truck's inventory{}
      truck.inventory.map do |item_obj|
        # We use item_obj[0] because the inventory
        # is a hash, and without calling two pipe vars,
        # one for key and one for value, it's returned
        # as an array of [key, value], and we need the
        # key.name (or item_obj name technically)
        item_obj[0].name
      end
      # Make sure there's no duplicates, sort alphabetically, flatten
    end.flatten.uniq.sort
  end

  # Basically the same thing as above but with entire objects
  def find_items_objects
    @food_trucks.map do |truck|
      truck.inventory.map do |kv_arr|
        kv_arr[0]
      end
    end.flatten.uniq
  end

  def total_inventory
    # Initialize empty hash
    inventory_hash = {}

    # Initialize empty array of unique items
    object_items_arr = find_items_objects

    # Iterate through each unique item
    object_items_arr.each do |item_obj|

      # Find trucks that contain this unique item
      found_trucks = @food_trucks.select do |truck|
        truck.inventory.key?(item_obj)
      end

      # Accumulator
      total_amount = 0
      # Search through all trucks that have this item
      # Add total supply to our accumulator
      found_trucks.each do |truck|
        total_amount += truck.inventory[item_obj]
      end
      # Create new key/pair value within our hash
      inventory_hash[item_obj] = {quantity: total_amount, food_trucks: found_trucks}
    end
    # return hash
    inventory_hash
  end

  def overstocked_items
    # Total inventory we comb through
    inventory = total_inventory
    # Accumulator
    overstocked = []

    inventory.each do |item_obj, item_obj_hash|
      # Check to see if an item has quantity of 50+, sold by more than 1 food truck
      if item_obj_hash[:quantity] > 50 && item_obj_hash[:food_trucks].size > 1
        # shift into overstocked array if condition above is true
        overstocked << item_obj
      end
    end
    # Return all overstocked items
    overstocked
  end
end
