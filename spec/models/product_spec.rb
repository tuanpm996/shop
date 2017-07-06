require 'rails_helper'

RSpec.describe Product, type: :model do
  context "In the Product" do
    before = Product.count
    it "add product" do
      Product.new(name:"Book", description: "About", price:45).save
      after=Product.count
      expect(before).to be < after
    end

    it "can't add product because of nil name" do
      Product.new(description: "About", price:45).save
      after=Product.count
      expect(before).to be == after
    end

    it "can't add product because of nil description" do
      Product.new(name:"Book", price:45).save
      after=Product.count
      expect(before).to be == after
    end

    it "can't add product because of nil price" do
      Product.new(name:"Book", description: "About").save
      after=Product.count
      expect(before).to be == after
    end
  end
end
