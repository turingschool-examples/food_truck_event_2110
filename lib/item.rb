class Item

  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price].delete("$").to_f.round(2)
  end


end
