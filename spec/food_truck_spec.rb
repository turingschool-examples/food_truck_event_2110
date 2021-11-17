require './lib/item'
require './lib/food_truck'
# pry(main)> food_truck.stock(item1, 30)
# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
# pry(main)> food_truck.check_stock(item1)
# #=> 30
# pry(main)> food_truck.stock(item1, 25)
# pry(main)> food_truck.check_stock(item1)
# #=> 55
# pry(main)> food_truck.stock(item2, 12)
# pry(main)> food_truck.inventory
# #=> {#<Item:0x007f9c56740d48...> => 55, #<Item:0x007f9c565c0ce8...> => 12}
RSpec.describe FoodTruck do
  let!(:item1){Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
  let!(:item2){Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
  let!(:food_truck){FoodTruck.new("Rocky Mountain Pies")}


  describe '#initialize' do
    it "exists" do
      expect(food_truck).to be_a FoodTruck
    end

    it "has attributes" do
      expect(food_truck.name).to eq "Rocky Mountain Pies"
      expect(food_truck.inventory).to be_a Hash
    end
  end

  describe '#check_stock' do
    it "checks the quantity level for a given item" do
      expect(food_truck.check_stock(item1)).to eq 0
    end
  end

  describe '#stock' do
    it "adds given item to ::inventory with a given quantity" do
      food_truck.stock(item1, 30)
      expect(food_truck.inventory).to eq({item1 => 30})
    end
  end
end
