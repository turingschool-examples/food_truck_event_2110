class FoodTruck

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item_obj, quantity)
    if @inventory[item_obj] == nil
      @inventory[item_obj] = quantity
    else
      @inventory[item_obj] += quantity
    end
   end

  def check_stock(item_obj)
    if @inventory.key?(item_obj)
      @inventory[item_obj]
    else
      @inventory[item_obj] = 0
    end
  end

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
