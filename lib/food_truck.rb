class FoodTruck
  attr_reader :name , :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def stock(item_object, number_of_item)
    @inventory[item_object] += number_of_item
  end

  def check_stock(item_object)
    @inventory.values_at(item_object).join.to_i
  end

  def potential_revenue
    @inventory.sum do |item_object, number_of_item|
      item_object.price * number_of_item
    end
  end

end
