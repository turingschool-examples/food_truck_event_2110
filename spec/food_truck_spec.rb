require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end
  describe 'initialize' do
    it 'exists' do
      expect(@food_truck).to be_a(FoodTruck)
    end
    it 'has_attributes' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end
  end

  describe 'methods' do
    describe ' #check_stock' do
      it 'returns an integer' do
        expect(@food_truck.check_stock(@item1)).to be_a(Integer)
      end
      it 'returns the correct count of the item' do
        expect(@food_truck.check_stock(@item1)).to eq(0)
        @food_truck.stock(@item1, 30)
        expect(@food_truck.check_stock(@item1)).to eq(30)
        @food_truck.stock(@item1, 25)
        expect(@food_truck.check_stock(@item1)).to eq(55)
      end
      it 'returns 0 if item is not in inventory' do
        expect(@food_truck.check_stock(@item1)).to eq(0)
      end
    end
    describe ' #stock' do
      it 'adds the item as a key to the inventory hash' do
        expect(@food_truck.inventory).to eq({})
        @food_truck.stock(@item1, 30)
        expect(@food_truck.inventory.keys).to eq([@item1])
      end
      it 'adds the # of items as a value to the inventory hash' do
        expect(@food_truck.inventory).to eq({})
        @food_truck.stock(@item1, 30)
        expect(@food_truck.inventory.values).to eq([30])
      end
    end
  end
end
