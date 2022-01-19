class Item
  attr_reader :name
  def initialize(item_info)
    @item_info = item_info
    @name = item_info[:name]
  end
end
