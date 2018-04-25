require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements
without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }

  describe "#initialize" do
    #let (:desert) {Desert.new('cake', 40, 'mr.anderson' )}
    dessert =  Dessert.new('cake', 40, 'some guy')
    it "sets a type" do
      expect(dessert.type).to eq('cake')
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(40)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new('cake',2.5,'some guy') }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    dessert =  Dessert.new('cake', 40, 'some guy')
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('flour')
      expect(dessert.ingredients).to include('flour')
    end
  end
  #
  describe "#mix!" do
    dessert =  Dessert.new('cake', 40, 'some guy')
    it "shuffles the ingredient array" do
      dessert.add_ingredient('eggs')
      dessert.add_ingredient('milk')
      dessert.add_ingredient('sugar')
      expect(dessert.mix!).to_not contain_exactly(['eggs','milk','sugar'])
    end
  end

  describe "#eat" do
    dessert =  Dessert.new('cake', 40, 'some guy')
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(19)).to eq(21)
    end

    dessert =  Dessert.new('cake', 40, 'some guy')
    it "raises an error if the amount is greater than the quantity" do
      expect{ dessert.eat(50) }.to raise_error
    end
  end

  describe "#serve" do
    let(:chef) { double("chef") }
    subject(:dessert) {  Dessert.new('cake', 40, chef) }
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("the great El Burro himself")
      expect(dessert.serve).to include("the great El Burro himself")
    end

  end

  describe "#make_more" do
    let(:chef) { double("chef") }
    subject(:dessert) {  Dessert.new('cake', 40, chef) }
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
