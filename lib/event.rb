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
    names = []
      @food_trucks.select do |truck|
        names << truck.name
      end
    return names
  end


end
