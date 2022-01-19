require 'date'
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

    @food_truck1.stock(@item1, 35)
    @food_truck1.stock(@item2, 7)
    @food_truck2.stock(@item4, 50)
    @food_truck2.stock(@item3, 25)
    @food_truck3.stock(@item1, 65)

	end

	it 'exists' do
		expect(@event).to be_a Event
	end

	it 'has attributes' do
		expect(@event.name).to eq ("South Pearl Street Farmers Market")
		expect(@event.food_trucks).to eq ([])
	end

  describe 'Iteration II and III' do
    before(:each) do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
    end


  	it 'can #add_food_trucks' do


  		expect(@event.food_trucks).to eq ([@food_truck1, @food_truck2, @food_truck3])
  	end

  	it 'can list #food_truck_names' do


  		expect(@event.food_truck_names).to eq (["Rocky Mountain Pies", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
  	end

  	it 'can list #food_trucks_that_sell a specific item' do


  		expect(@event.food_trucks_that_sell(@item1)).to eq ([@food_truck1, @food_truck3])
  		expect(@event.food_trucks_that_sell(@item4)).to eq ([@food_truck2])
  	end

  	it 'can find #potential_revenue for each truck' do

  		expect(@food_truck1.potential_revenue).to eq (148.75)
  		expect(@food_truck2.potential_revenue).to eq (345.00)
  		expect(@food_truck3.potential_revenue).to eq (243.75)
  	end

  	xit 'can find #total_inventory for each truck' do

      @food_truck3.stock(@item3, 10)

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
            quantity: 35,
            food_trucks: [@food_truck2, @food_truck3]
          },
        }

  		expect(@event.total_inventory).to eq (expected)
  	end

  	xit 'can find #overstocked_items' do

  		expect(@event.overstocked_items).to eq (@item_1)
  	end

  	xit 'can do a #sorted_item_list' do

      expected = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]

  		expect(@event.overstocked_items).to eq (expected)
  	end

  end
  describe 'Iteration IIII' do
    before(:each) do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)
    end

    xit 'can list todays #date' do

  		expect(@event.date).to eq ("24/02/2020")
  	end

    xit 'can #sell(item, amount)' do

  		expect(@event.sell(@item1, 200)).to eq false
  		expect(@event.sell(@item5, 1)).to eq false
  		expect(@event.sell(@item4, 5)).to eq true
  	end

    xit 'can still #check_stock' do

  		expect(@food_truck2.check_stock(@item4)).to eq 45
  	end

    xit 'can #sell(item, amount)' do

  		expect(@event.sell(@item1, 40)).to eq true
  	end

    xit 'can still #check_stock' do

  		expect(@food_truck1.check_stock(@item1)).to eq 0
  		expect(@food_truck3.check_stock(@item1)).to eq 60
  	end
  end
end
