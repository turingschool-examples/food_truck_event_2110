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
    food_trucks_arr = @food_trucks.select do |truck|
      truck.inventory.key?(item_obj)
    end
  end

  # Fat comment in this one, will probably
  # remove in time

  # Also I know I can use =begin || =end, it just looks ugly
  def sorted_item_list

    item_array = []
    # Go through each Truck in @food_trucks[]
    @food_trucks.each do |truck|
      # Go through each Truck's inventory{}
      truck.inventory.each do |item_obj|
        # We use item_obj[0] because the inventory
        # is a hash, and without calling two pipe vars,
        # one for key and one for value, it's returned
        # as an array of [key, value], and we need the
        # key.name (or item_obj name technically)
        item_array << item_obj[0].name
      end
    end

    item_array.uniq.sort
  end
end
