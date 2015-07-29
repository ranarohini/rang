class OrdersController < SessionsController
  before_filter :initialize_cart

  #paypal express checkout
  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase(@cart.price_in_cents,
                                              ip: request.remote_ip,
                                              return_url: checkout_cart_url,
                                              cancel_return_url: root_url
                                              )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end


  def review
    if params[:token].nil?
      redirect_to root_url, :notice => 'Sorry! Something went wrong!' 
      return
    end

    gateway_response = response.details_for(params[:token])

    unless gateway_response.success?
      redirect_to root_url, :notice => "Sorry! Something went wrong with the Paypal purchase. Here's what Paypal said: #{gateway_response.message}" 
      return
    end

    redirect_to root_url, :notice => "Processed. Here's what Paypal said: #{gateway_response.message}" 
    #@order_info = get_order_info gateway_response, @cart
  end

  # creates order
  def create
    @order_form = OrderForm.new(
      user: current_user,
      cart: @cart)
    
    if @order_form.save
      session[:cart] = nil
      redirect_to root_path, notice: 'Thank you for shopping'
    else
      render 'carts/checkout'
    end
  end
end
