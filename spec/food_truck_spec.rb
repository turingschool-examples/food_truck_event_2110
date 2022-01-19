require './lib/food_truck'
require './lib/item'

describe FoodTruck do
  before(:each) do
    @item1 = Item.new({ name: 'Peach Pie (Slice)', price: "$3.75" })
    @item2 = Item.new({ name: 'Apple Pie (Slice)', price: "$2.50" })
    @item3 = Item.new({ name: "Peach-Raspberry Nice Cream", price: "$5.30" })
    @item4 = Item.new({ name: "Banana Nice Cream", price: "$4.25" })

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
    describe '#check_stock' do
      it 'returns an integer' do
        expect(@food_truck.check_stock(@item1)).to be_a(Integer)
      end
      it 'returns the count of the item' do
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

    describe '#stock' do
      it 'adds the item as a key to the inventory hash' do
        expect(@food_truck.inventory).to eq({})
        @food_truck.stock(@item1, 30)
        expect(@food_truck.inventory.keys).to eq([@item1])
      end

      it 'adds the number of items as a value to the inventory hash' do
        expect(@food_truck.inventory).to eq({})
        @food_truck.stock(@item1, 30)
        expect(@food_truck.inventory.values).to eq([30])
      end
    end

    describe '#potential_revenue' do
      before(:each) do
        @food_truck.stock(@item1, 35)
        @food_truck.stock(@item2, 7)
      end

      it 'returns a Float' do
        expect(@food_truck.potential_revenue).to be_a(Float)
      end

      it 'returns the sum of all items * prices' do
        expect(@food_truck.potential_revenue).to eq(148.75)
      end
    end

    describe 'inventory_list' do
      before(:each) do
        @food_truck.stock(@item1, 35)
        @food_truck.stock(@item2, 7)
      end

      it 'returns an array' do
        expect(@food_truck.inventory_list).to be_a(Array)
      end

      it 'returns a sorted list of all item names' do
        expected = ['Apple Pie (Slice)', 'Peach Pie (Slice)']
        expect(@food_truck.inventory_list).to eq(expected)
      end
    end

    describe 'inventory_items' do
      before(:each) do
        @food_truck.stock(@item1, 35)
        @food_truck.stock(@item2, 7)
      end

      it 'returns an array' do
        expect(@food_truck.inventory_list).to be_a(Array)
      end

      it 'returns a sorted list of items' do
        expected = [@item2, @item1]
        expect(@food_truck.inventory_list).to eq(expected)
      end
    end
  end
end
