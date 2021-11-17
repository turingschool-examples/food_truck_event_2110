class Item

  attr_reader :name, :price

  def initialize(info)
    @name = info[:name]
    @price = set_price(info[:price])#(((info[:price].chars).delete_at(0)).join()).to_i

  end

  def set_price(price_string)
    characters = price_string.chars
    characters.delete_at(0)
    new_string = characters.join
    amnt_as_float = new_string.to_f
    amnt_as_float
  end

end
