require './lib/item'
require './lib/food_truck'
require './lib/event'

 RSpec.describe Event do
 	before(:each) do
 		@event = Event.new("South Pearl Street Farmers Market")
    @food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    @food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    @food_truck3 = FoodTruck.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
 	end

    context 'Iteration 2' do
     	it 'exists' do
     		expect(@event).to be_a(Event)
     	end

     	it 'has attributes' do
     		expect(@event.name).to eq("South Pearl Street Farmers Market")
     		expect(@event.food_trucks).to eq([])
     	end

      it 'can add trucks and return array of all food trucks' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
      end

      it 'can return an array of all food truck names' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.food_truck_names).to eq(["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
      end

      it 'can return a list of FoodTrucks that have that item in stock.' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
        expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
      end

      it 'can calculate potential revenue for each truck' do
        @food_truck1.stock(@item1, 35)
        @food_truck1.stock(@item2, 7)
        @food_truck2.stock(@item4, 50)
        @food_truck2.stock(@item3, 25)
        @food_truck3.stock(@item1, 65)
        @event.add_food_truck(@food_truck1)
        @event.add_food_truck(@food_truck2)
        @event.add_food_truck(@food_truck3)

        expect(@food_truck1.potential_revenue).to eq(148.75)
        expect(@food_truck2.potential_revenue).to eq(345.00)
        expect(@food_truck3.potential_revenue).to eq(243.75)
      end
    end

    context 'Iteration 3' do

      it 'can report quantities of all items sold at event' do
       @food_truck1.stock(@item1, 35)
       @food_truck1.stock(@item2, 7)
       @food_truck2.stock(@item4, 50)
       @food_truck2.stock(@item3, 25)
       @food_truck3.stock(@item1, 65)
       @food_truck3.stock(@item3, 10)
       @event.add_food_truck(@food_truck1)
       @event.add_food_truck(@food_truck2)
       @event.add_food_truck(@food_truck3)

       expected = {
       @item1 => {
       quantity: 100,
       food_trucks: [@food_truck1, @food_truck3]},
       @item2 => {
       quantity: 7,
       food_trucks: [@food_truck1]},
       @item3 => {
         quantity: 35,
         food_trucks: [@food_truck2, @food_truck3]},
        @item4 => {
        quantity: 50,
        food_trucks: [@food_truck2]}
       }
       expect(@event.total_inventory).to eq(expected)
     end

     it 'can detect if item is sold by more than 1 food truck & total quantity is > 50' do
       @food_truck1.stock(@item1, 35)
       @food_truck1.stock(@item2, 7)
       @food_truck2.stock(@item4, 50)
       @food_truck2.stock(@item3, 25)
       @food_truck3.stock(@item1, 65)
       @food_truck3.stock(@item3, 10)
       @event.add_food_truck(@food_truck1)
       @event.add_food_truck(@food_truck2)
       @event.add_food_truck(@food_truck3)

       expect(@event.overstocked_items).to eq([@item1])
     end

    end
end
