class CartsController < ApplicationController
  include ApplicationHelper	

  def edit
    session[:cart_id] = Cart.last.id
    cart_id = session[:cart_id]
    product_id = params[:product_id]
    quantity = params[:quantity]
    @cart = Cart.find_by(id: cart_id)
    if @cart.cartItems.count == 0 && !product_id
      byebug
      redirect_to root_path
    else
      if product_id

        if (cart_id && Cart.find(cart_id))
          if Cart.find(cart_id).cartItems.find_by(product_id: product_id)
            Cart.find(cart_id).cartItems.find_by(product_id:product_id).update_attribute(:quantity, quantity)
          else
            Cart.find(cart_id).cartItems.build(product_id: product_id, quantity:quantity).save
          end
        else
          @cart=Cart.new()
          @cart.save
          session[:cart_id] = Cart.last.id
          @cart.cartItems.build(product_id: product_id, quantity:quantity).save
        end
        respond_to do |f|
          f.html {return redirect_to root_path}
          f.js {return render json: {status: 'success', message: "Cart was updated"}}
        end
      else
        @cart = Cart.find(session[:cart_id])
      end  
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
    @cart = Cart.find_by(id: session[:cart_id])
    @cart.update_attributes(cart_params)
    redirect_to edit_cart_path
  end


  private
    def create
      cart=Cart.new()
      session[:cart_id] = cart.id
    end

    def cart_params
      params.require(:cart).permit(cartItems_attributes:[:quantity, :id, :_destroy])
    end

end
