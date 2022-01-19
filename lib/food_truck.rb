class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    # @inventory.select do |inven|
    #    if inven == item
    #      binding.pry
         @inventory[item]
    #    end
    # end
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

end
