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

      it 'will add to an already existing item quantity' do
        @food_truck.stock(@item1, 25)
        expect(@food_truck.check_stock(@item1)).to be 55
      end

      it 'will contain multiple items and quantities' do
        @food_truck.stock(@item1, 25)
        @food_truck.stock(@item2, 12)
        expected = { @item1 => 55, @item2 => 12 }
        expect(@food_truck.inventory).to eq expected
      end

      describe '#potential_revenue' do
        before :each do
          @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
          @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
          @food_truck3 = FoodTruck.new("Palisade Peach Shack")

          @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
          @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
          @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
          @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

          @food_truck1.stock(@item1, 35)
          @food_truck1.stock(@item2, 7)

          @food_truck2.stock(@item4, 50)
          @food_truck2.stock(@item3, 25)

          @food_truck3.stock(@item1, 65)
        end

        it 'returns the total amount of money to be made if a truck sells its entire inventory' do
          expect(@food_truck1.potential_revenue).to eq 148.75
          expect(@food_truck2.potential_revenue).to eq 345.00
          expect(@food_truck3.potential_revenue).to eq 243.75
        end
      end
    end
  end
end
