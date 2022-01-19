require 'spec_helper'

describe FoodTruck do
  before :each do
    @food_truck = FoodTruck.new('Rocky Mountain Pies')
    @item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    @item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
  end

  it 'exists and has attributes' do
    expect(@food_truck).to be_a(FoodTruck)
    expect(@food_truck.name).to eq('Rocky Mountain Pies')
    expect(@food_truck.inventory).to eq({})
  end

  it 'can check stocked items' do
    expect(@food_truck.check_stock(@item1)).to eq(0)
  end

  it 'can check stock items' do
    @food_truck.stock(@item1, 30)
    expect(@food_truck.check_stock(@item1)).to eq(30)
    @food_truck.stock(@item1, 25)
    expect(@food_truck.check_stock(@item1)).to eq(55)
  end

  xit 'can stock items and check inventory' do
    @food_truck.stock(@item1, 30)
    @food_truck.stock(@item1, 25)
    @food_truck.stock(@item2, 12)
    expected = {
      :@item2 => 55,
      :@item2 => 12
    }
    expect(@food_truck.check_stock(@item2)).to eq(expected)
  end

  xit 'can calculate potential revenue' do
    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)
    expect(@food_truck1.potential_revenue).to eq(148.75)
    expect(@food_truck2.potential_revenue).to eq(345.00)
    expect(@food_truck3.potential_revenue).to eq(243.75)
  end
end
