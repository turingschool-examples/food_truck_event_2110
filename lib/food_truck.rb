class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  # Check if item exists in hash
  # If it doesn't, create it,
  # if it does, only add to its value
  def stock(item_obj, quantity)
    if @inventory[item_obj] == nil
      @inventory[item_obj] = quantity
    else
      @inventory[item_obj] += quantity
    end
   end

  # If item exists, return its value
  # if it doesn't exist, create a key value pair where
  # the value is 0
  def check_stock(item_obj)
    if @inventory.key?(item_obj)
      @inventory[item_obj]
    else
      # This shouldn't be making a key pair value
      0
    end
  end

  # Loop through all key/value pairs in our inventory{}
  # Multiply quantity of an object by its value
  # Return value
  def potential_revenue
    possible_revenue = 0

    # Inside of our loop, it turns possible_revenue
    # into an array
    @inventory.map do |item_obj, item_quantity|
      fiscal_value = item_obj.price * item_quantity
      possible_revenue += fiscal_value
    end
    # We have to call it again to return as integer
    possible_revenue
  end


end
