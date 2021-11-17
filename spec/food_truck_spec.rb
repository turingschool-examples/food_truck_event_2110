require './lib/food_truck'


describe FoodTruck do

  before(:each) do
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@food_truck).to be_a(FoodTruck)
    end
    it 'has attributes' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
      expect(@food_truck.inventory).to eq({})
    end
  end

  describe '#stock' do
    it 'adds an item and its quantity to the inventory' do
      @food_truck.stock(@item1, 30)
      expect(@food_truck.inventory).to eq({@item1 => 30})
    end
  end

  describe '#check_stock' do
    it 'returns the quantity of an item' do
      expect(@food_truck.check_stock(@item1)).to eq(0)
      @food_truck.stock(@item1, 30)
      expect(@food_truck.check_stock(@item1)).to eq(30)
    end
  end

  describe '#potential_revenue' do
    it 'returns the sum of all their items price * quantity.' do
      @food_truck.stock(@item1, 30)
      @food_truck.stock(@item2, 15)
      expect(@food_truck.potential_revenue).to eq(150.00)
    end
  end

end
