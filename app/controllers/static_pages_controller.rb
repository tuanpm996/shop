class StaticPagesController < ApplicationController
  def home
  	session[:cart_id]=Cart.last.id
  	@products = Product.all
  end
end
