class Item

  attr_reader :name, :price, :stock

  def initialize(details)
    @name = details[:name]
    @price = details[:price].delete("$").to_f
    @stock = 0
  end

end
