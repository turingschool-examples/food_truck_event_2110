require './lib/item'
require './lib/food_truck'
require './lib/event'

describe Event do
  before(:each) do
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

    @event = Event.new("South Pearl Street Farmers Market")
    @event.add_food_truck(@food_truck1)
    @event.add_food_truck(@food_truck2)
    @event.add_food_truck(@food_truck3)
  end

  it 'exists' do
    expect(@event).to be_a(Event)
  end

  it 'has a name' do
    expect(@event.name).to eq("South Pearl Street Farmers Market")
  end

  it 'has food trucks' do
    expect(@event.food_trucks).to be_a(Array)
  end

  it 'adds food trucks' do
    expect(@event.food_trucks.count).to eq(3)
  end

  it 'gets food truck names' do
    expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

    expect(@event.food_truck_names).to eq(expected)
  end

  it 'finds food trucks by item sold' do
    expected = [@food_truck1, @food_truck3]

    expect(@event.food_trucks_that_sell(@item1)).to eq(expected)
  end

  it 'returns sorted item list' do
    expected = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]

    expect(@event.sorted_item_list).to eq(expected)
  end

  it 'returns total inventory' do
    expected = {
    @item1 => {
      quantity: 100,
      food_trucks: [@food_truck1, @food_truck3]
    },
    @item2 => {
      quantity: 7,
      food_trucks: [@food_truck1]
    },
    @item4 => {
      quantity: 50,
      food_trucks: [@food_truck2]
    },
    @item3 => {
      quantity: 25,
      food_trucks: [@food_truck2]
    }
  }
  expect(@event.total_inventory).to be_a(Hash)
  expect(@event.total_inventory).to eq(expected)
  end

  it 'finds overstocked items' do
    expected = [@item1]

    expect(@event.overstocked_items).to eq(expected)
  end

  it 'sells items'

  expect(@event.sell(@item1.101)).to eq(false)
  expect(@event.sell(@item1.100)).to eq(true)
end
