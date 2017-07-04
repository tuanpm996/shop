module ApplicationHelper
  
  def current_cart
  @current_cart= Cart.last
  end


end
