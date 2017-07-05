require 'rails_helper'

RSpec.describe CartsController, type: :controller do
	
context 'and a context with another variable' do 
  cart=Cart.create!()
  product = Product.create!(name:"fdfdfd", description: "fdfdfd", price:45)	

  it "redirect to root if cart is empty" do
    get 'edit', params: {id: cart.id}
    response.should redirect_to root_path
  end

  it "redirect to edit page if cart is not empty" do
    cart.cartItems.build(product_id: product.id, quantity: 4).save
    get 'edit', :id=>cart.id
    response.should render_template('carts/edit')
  end

  it "add product to cart in home page" do
    before=cart.cartItems.count
    session[:cart_id]=cart.id
    post 'edit', params: {product_id: product.id, quantity: 4}
    after=cart.cartItems.count
    response.should redirect_to root_path
    expect(before).to be < after
  end

  it "change product quantity cart in edit page" do
    cart.cartItems.build(product_id: product.id, quantity: 3).save
    before = 3
    get 'edit', params: {id: cart.id}
    get 'update', params: {cart:{cartItems_attributes:{ "0":{ quantity: 6, _destroy: 0,id:cart.cartItems.first.id}}},commit:"Save changes", id: 11}
    after=cart.cartItems.first.quantity
    expect(before).to be < after
  end

  it "delete cart" do
    cart.cartItems.build(product_id: product.id, quantity: 3).save
    before = Cart.count
    post 'destroy', params: {id: cart.id}
    after= Cart.count
    expect(before).to be < after
  end
end
end
