class FoodTruck

 attr_reader :name, :inventory

 def initialize(name)
  @name = name
  @inventory = Hash.new(0)
 end

 def check_stock(item)
  how_many = 0
  @inventory.select do |stock, quanity|
    how_many += quanity if  stock == item
  end
  how_many
 end

 def stock(item, quanity)
   @inventory[item] += quanity
 end

 def potential_revenue
   pot_revenue = 0
   @inventory.map do |stock, quanity|
     total = stock.price.delete('$').to_f * quanity
     pot_revenue += total
   end
  return pot_revenue
 end
end
