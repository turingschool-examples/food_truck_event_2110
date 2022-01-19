require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end
  it 'will be an instance of FoodTruck ' do
    expect(@food_truck).to be_instance_of(FoodTruck)
  end
  it 'will have a name' do
    expect(@food_truck.name).to eq('Rocky Mountain Pies')
  end
  describe '#inventory' do
    it 'will initially have no inventory' do
      expect(@food_truck.inventory).to eq({})
    end
    it 'can look up the inventory of a particular item ' do
      expect(@food_truck.check_stock(@item1)).to eq(0)
    end
    it 'can add inventory ' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.inventory).to eq({@item1 => 30})
    end
    it 'can look up the inventory of particular item and return value' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.check_stock(@item1)).to eq(30)
      @food_truck.stock(@item1, 25)
      expect(@food_truck.check_stock(@item1)).to eq(55)
    end
    it 'can add stock for 2nd item' do
      @food_truck.stock(@item1, 30)
      @food_truck.stock(@item1, 25)
      @food_truck.stock(@item2, 12)
      expect(@food_truck.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end
  it 'will return the potential revenue of a truck' do

    @food_truck.stock(@item1, 55)
    @food_truck.stock(@item2, 12)
    expect(@food_truck.potential_revenue).to eq(236.25)
  end
end
