require 'pry'
class Item
  attr_reader :name, :price

  def initialize(info)
    @name = info.fetch(:name)
    @price = info.fetch(:price).split("").delete_if { |char| char == '$'}.join.to_f
  end
end
