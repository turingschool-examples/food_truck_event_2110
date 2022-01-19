require 'pry'

class Item
  attr_reader :attributes, :name, :price
  attr_accessor

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @price = attributes[:price]
  end


end
