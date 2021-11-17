class Item

  attr_reader :name, :price

  def initialize(inputted_hash)
    @name = inputted_hash[:name]
    @price = inputted_hash[:price].tr("$", "").to_f
  end

end
