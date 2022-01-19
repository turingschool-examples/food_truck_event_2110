require './lib/item'
require './lib/food_truck'
require 'rspec'
require 'pry'

RSpec.describe FoodTruck do

  context 'iteration I' do

    let(:item1) {Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})}
    let(:item2) {Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})}
    let(:food_truck) {FoodTruck.new("Rocky Mountain Pies")}

    it 'exists' do

      expect(food_truck).to be_an_instance_of(FoodTruck)
    end

    it 'has attributes' do

      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end

    it '#check_stock' do

      expect(food_truck.check_stock(item1)).to eq(0)
      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq(30)
      food_truck.stock(item1, 25)
      expect(food_truck.check_stock(item1)).to eq(55)
    end

    it '#stock' do

      food_truck.stock(item1, 30)
      expect(food_truck.check_stock(item1)).to eq(30)
    end
  end
end
