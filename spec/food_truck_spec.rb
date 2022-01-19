require './lib/food_truck'
require './lib/item'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end
  it 'is initialized with a name' do
    expect(@food_truck).to be_instance_of FoodTruck
    expect(@food_truck.name).to eq "Rocky Mountain Pies"
  end

  it 'is initialized with an empty inventory hash' do
    expect(@food_truck.inventory).to be_a Hash
    expect(@food_truck.inventory).to be_empty
  end

  describe '#check_stock' do
    before :each do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    end

    it 'can check the stock of an item, stock will default to 0' do
      expect(@food_truck.check_stock(@item1)).to be_an Integer
      expect(@food_truck.check_stock(@item1)).to be 0
    end

    describe '#stock' do
      before :each do
        @food_truck.stock(@item1, 30)
      end

      it 'takes an item object and a quantity as args, and places the object in inventory' do
        expected = { @item1 => 30 }
        expect(@food_truck.inventory).to eq expected
      end

      it '#check_stock will return the updated value' do
        expect(@food_truck.check_stock(@item1)).to be_an Integer
        expect(@food_truck.check_stock(@item1)).to be 30
      end
    end
  end
end
