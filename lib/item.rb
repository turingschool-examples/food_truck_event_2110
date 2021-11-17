class Item

  attr_reader :name, :price

  def initialize(inputted_hash)
    @name = inputted_hash[:name]
    # Gets rid of the '$' in the string so it can
    # properly return as a float
    @price = inputted_hash[:price].tr("$", "").to_f
  end

end
