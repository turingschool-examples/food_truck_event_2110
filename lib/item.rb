class Item

  attr_reader :name, :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end

  def price
    test = @price.gsub(/\D/,'').to_f
    test / 100
  end

end
