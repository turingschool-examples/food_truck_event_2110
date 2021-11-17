require './lib/item'
require './lib/food_truck'
require './lib/event'
describe Event do
  it 'exists' do
    event = Event.new("South Pearl Street Farmers Market")

    expect(event).to be_a Event
    expect(event.name).to eq ("South Pearl Street Farmers Market")
    expect(event.food_trucks).to eq ([])
  end

  it 'Can show all food trucks ' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected = [food_truck1,food_truck2,food_truck3]

    expect(event.food_trucks).to eq (expected)
  end

  it 'Can show all food trucks by name ' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected = ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

    expect(event.food_truck_names).to eq (expected)
  end

  it 'Can show array of all trucks that sell an item' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected = [food_truck1,food_truck3]

    expect(event.food_trucks_that_sell(item1)).to eq (expected)
    expected_2 = [food_truck2]

    expect(event.food_trucks_that_sell(item4)).to eq (expected_2)
  end

  it 'Can show a sorted list of all items the food trucks have in stock alphabetically' do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

  end

  it 'Can show total inventory of an event' do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected =
    {
      item1 => {
        quantity: 100 ,
        food_trucks: [food_truck1, food_truck3]
      },
      item2 => {
        quantity: 7 ,
        food_trucks: [food_truck1]
      },
      item4 => {
        quantity: 50 ,
        food_trucks: [food_truck2]
      },
      item3 => {
        quantity: 35 ,
        food_trucks: [food_truck2,food_truck3]
      },
    }


    expect(event.total_inventory).to eq (expected)
  end

  it 'Can show an array of all unique items' do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected =

    expect(event.total_items).to eq ([item1, item2, item4,item3])
  end

  it 'Can show quantity of all items' do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.item_quant(item1)).to eq 100
    expect(event.item_quant(item2)).to eq 7
    expect(event.item_quant(item3)).to eq 35
    expect(event.item_quant(item4)).to eq 50
  end

  it 'Can hash for each item quantity and who sells' do
    event = Event.new("South Pearl Street Farmers Market")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)
    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)
    expected =
    {
      quantity: 100 ,
      food_trucks: [food_truck1, food_truck3]
    }
    expected_2 =
    {
    quantity: 7 ,
    food_trucks: [food_truck1]
    }
    expected_3 =
    {
    quantity: 50 ,
    food_trucks: [food_truck2]
    }
    expected_4 =
    {
    quantity: 35 ,
    food_trucks: [food_truck2,food_truck3]
    }
    expect(event.item_details(item1)).to eq (expected)
    expect(event.item_details(item2)).to eq (expected_2)
    expect(event.item_details(item4)).to eq (expected_3)
    expect(event.item_details(item3)).to eq (expected_4)
  end
end
