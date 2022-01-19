class Item

 attr_reader :name, :price

 def initialize(attributes)
  @name = attributes.fetch(:name)
  @price = attributes.fetch(:price)
 end
end
