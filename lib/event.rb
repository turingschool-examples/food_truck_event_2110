class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks.push(truck)
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end
  end

  def food_trucks_that_sell(item)
    trucks_with_inventory = []
    @food_trucks.each do |truck|
      truck.inventory.each do |thing|
        if thing[0].name == item.name
          trucks_with_inventory.push(truck)
        end
      end
    end
    trucks_with_inventory
  end

  # def total_inventory
  #   list = Hash.new
  #   amount_trucks = Hash.new
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |items|
  #       items.each do |item|
  #         amount_trucks[:quantity] = items.last
  #         if @food_trucks.
  #         amount_trucks[:food_trucks] = @food_trucks
  #         list[:item] = amount_trucks
  #         amount_trucks[:quantity] += items.last
  #         require "pry"; binding.pry
  #       end
  #     end
  #   end
  # end

#   def sorted_item_list
#     list_of_items = []
#     names = []
#     @food_trucks.each do |truck|
#       truck.inventory.each do|items|
#         list_of_items.push(items)
#       end
#     end
#     list_of_items.pop.each do |item|
#       # require "pry"; binding.pry
#       names.push(item.name)
#
# #       [1] pry(#<Event>)> item
# # => #<Item:0x0000000123b11d30 @name="Peach-Raspberry Nice Cream", @price=5.3>
# # [2] pry(#<Event>)> item.name
# # => "Peach-Raspberry Nice Cream"
# # [3] pry(#<Event>)> names.push(item.name)
# # => ["Peach-Raspberry Nice Cream"]
# # [4] pry(#<Event>)> names
# # => ["Peach-Raspberry Nice Cream"]
#     end
#   end
end
