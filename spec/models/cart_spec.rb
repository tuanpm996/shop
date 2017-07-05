require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "add product to cart" do
  	cart=Cart.create!()
  	product=Product.create!(name:"fdfdfd", description: "fdfdfd", price:45)
  	cart.save
    before=cart.cartItems.count
    cart.cartItems.build(product_id: 1,quantity: 19).save
    after=cart.cartItems.count
    expect(before).to be < after
  end

  it "can't add product to cart because of nil product_id" do
  	cart=Cart.create!()
  	product=Product.create!(name:"fdfdfd", description: "fdfdfd", price:45)
  	cart.save
    before=cart.cartItems.count
    cart.cartItems.build(quantity: 19).save
    after=cart.cartItems.count
    expect(before).to be == after
  end

  it "can't add product to cart because of nil quantity" do
  	cart=Cart.create!()
  	product=Product.create!(name:"fdfdfd", description: "fdfdfd", price:45)
  	cart.save
    before=cart.cartItems.count
    cart.cartItems.build(product_id:product.id).save
    after=cart.cartItems.count
    expect(before).to be == after
  end

end
