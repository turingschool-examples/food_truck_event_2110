require './spec/spec_helper.rb'

describe Event do
  describe 'Iteration 2' do
    before(:each) do
      @event = Event.new("South Pearl Street Farmers Market")

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

    it 'exists' do
      expect(@event).to be_instance_of Event
    end

    it 'has a name' do
      expect(@event.name).to eq "South Pearl Street Farmers Market"
    end

    it 'starts with no food trucks' do
      expect(@event.food_trucks).to eq []
    end

    it 'can add food trucks' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks).to eq [@food_truck1, @food_truck2, @food_truck3]
    end

    it 'names all of its food trucks' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_truck_names).to eq ["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"]
    end

    it 'finds the food trucks that sell a certain item' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
      expect(@event.food_trucks_that_sell(@item1)).to eq [@food_truck1, @food_truck3]
      expect(@event.food_trucks_that_sell(@item4)).to eq [@food_truck2]
    end
  end

  describe 'Iteration 3' do
    before(:each) do
      @event = Event.new("South Pearl Street Farmers Market")

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
      @food_truck3.stock(@item3, 10)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
    end

    it 'finds the total inventory' do
      expected = {
        @item1 => {quantity: 100, food_trucks: [@food_truck1, @food_truck3]},
        @item2 => {quantity: 7, food_trucks: [@food_truck1]},
        @item3 => {quantity: 35, food_trucks: [@food_truck2, @food_truck3]},
        @item4 => {quantity: 50, food_trucks: [@food_truck2]}
      }
      expect(@event.total_inventory).to eq expected
    end

    it 'finds overstocked items' do
      expect(@event.overstocked_items).to eq [@item1]
    end

    it 'generates an alphabetical list of all items' do
      expected = [
        "Apple Pie (Slice)",
        "Banana Nice Cream",
        "Peach Pie (Slice)",
        "Peach-Raspberry Nice Cream"
      ]
      expect(@event.sorted_item_list).to eq expected
    end
  end

  describe 'Iteration 4' do
    before(:each) do
      @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @item5 = Item.new({name: 'Onion Pie', price: '$25.00'})

      @event = Event.new("South Pearl Street Farmers Market")

      @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
      @food_truck1.stock(@item1, 35)
      @food_truck1.stock(@item2, 7)

      @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)

      @food_truck3 = FoodTruck.new("Palisade Peach Shack")
      @food_truck3.stock(@item1, 65)

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
    end

    it 'has a date' do
      expect(@event.date).to eq "19/01/2022"
    end

    it 'cannot sell more than there is' do
      expect(@event.sell(@item1, 200)).to be false
      expect(@event.sell(@item5, 1)).to be false
    end

    it 'can sell items that are in stock' do
      expect(@event.sell(@item4, 5)).to be true
      expect(@food_truck2.check_stock(@item4)).to eq 45
    end

    it 'sells items from food trucks in the order they were added to the event' do
      expect(@event.sell(@item1, 40)).to be true
      expect(@food_truck1.check_stock(@item1)).to eq 0
      expect(@food_truck3.check_stock(@item1)).to eq 60
    end
  end
end
