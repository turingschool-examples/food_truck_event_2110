class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] += quantity
  end

  def potential_revenue
    # rival_team = opponent(team_id).max_by do |k,v|
    #   v.count("WIN") / v.length.to_f
    costs = @inventory.map do |k,v|
      k.price.slice!('$')
      k.price.to_f * v
    end
    costs.sum
    # prices = @inventory.keys.map { |item| item.price  }
    # @inventory.values
    end
  end
