class FoodTruck

 attr_reader :name, :inventory

 def initialize(name)
  @name = name
  @inventory = {}
 end

 def check_stock(item)
  how_many = 0
  @inventory.select do |stock, quanity|
    how_many += quanity if  stock == item
  end
  how_many
 end

 def stock(item, quanity)
   @inventory[item] = quanity
 end
end
