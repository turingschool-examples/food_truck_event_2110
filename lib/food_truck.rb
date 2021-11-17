class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    stock_of_item = 0
    @inventory.each do |things , amount|
      if things == item
        return amount
      end
    end
    stock_of_item
  end

  def stock(item, amount)
    if @inventory.key?(item)
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end


end
