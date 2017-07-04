class CartsController < ApplicationController
  include ApplicationHelper	
  

  def edit
    # byebug
    product_id= params[:id]
    if (params[:product_id])
      if (session[:cart_id] && Cart.find_by(id:session[:cart_id]))
         if Cart.find_by(id:session[:cart_id]).cartItem.find_by(product_id: params[:product_id])
           Cart.find_by(id:session[:cart_id]).cartItem.find_by(product_id: params[:product_id]).update_attribute(:quantity, params[:quantity])
         else
           Cart.find_by(id:session[:cart_id]).cartItem.build(product_id: product_id, quantity:params[:quantity]).save
         end
         # byebug
      else
          @cart=Cart.new()
          @cart.save
          session[:cart_id] = Cart.last.id
          @cart.cartItem.build(product_id: product_id, quantity:params[:quantity]).save
      end
    else
      # byebug
      @cart = Cart.find(session[:cart_id])

    end
    
  end


  def show
    session[:cart_id] = Cart.last.id
    @cart = Cart.find_by(id: session[:cart_id])
    if @cart.cartItem.count != 0
      
    else
      redirect_to root_path
    end
    
  end


  def destroy
   session[:cart_id] = nil
   @cart=Cart.new()
   @cart.save
   session[:cart_id] = @cart.id
   redirect_to root_path
  end

  def update
    
  end

  private
    def create
      cart=Cart.new()
      session[:cart_id] = cart.id
    end


end
