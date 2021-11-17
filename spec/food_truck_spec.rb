require './lib/item'
require './lib/food_truck'

describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe '#initialize' do
    it 'returns an instance of a food truck' do
      expect(@food_truck).to be_a FoodTruck
    end

    it 'returns the name of the food truck' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'returns the inventory of the food truck' do
      expect(@food_truck.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'returns the quantity of the chosen item' do
      expect(@food_truck.check_stock(@item1)).to eq(0)
    end

    it 'can take multiple items' do
      @food_truck.stock(@item1, 30)
      @food_truck.stock(@item1, 25)
      expect(@food_truck.check_stock(@item1)).to eq(55)
      @food_truck.stock(@item2, 12)
      expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end

  describe '#stock' do
    it 'allows for an item to be stocked with a specific quantity' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.check_stock(@item1)).to eq(30)
    end
  end
end
