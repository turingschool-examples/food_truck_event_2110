class Event

  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map {|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    sellers = []
    @food_trucks.each do |truck|
      if truck.inventory.include? item
        sellers << truck
      end
    end
    sellers
  end

  def sorted_item_list
    items_list = []
    @food_trucks.each do |truck|
      truck.inventory.each do |k, v|
        items_list << k.name
      end
    end
    items_list.sort.uniq!
  end



end