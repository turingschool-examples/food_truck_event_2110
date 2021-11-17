class FoodTruck
  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.keys.include?(item) == false
      return 0
    else
      @inventory[item]
    end
  end

  def stock(item, quantity)
    if @inventory.keys.include?(item) == false
      @inventory[item] = quantity
    else
      @inventory[item] += quantity
    end
  end

  def potential_revenue
    prices = @inventory.keys.map {|item| item.price.gsub('$','').to_f}
    paired_arrays = @inventory.values.zip(prices)
    paired_arrays.map {|pair| pair.inject(:*)}.inject(:+)
  end
end
