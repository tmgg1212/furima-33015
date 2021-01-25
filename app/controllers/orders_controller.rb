class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
    @ordershipping_addresses = OrderShippingAddresses.new
    
  end

  def create
    @ordershipping_addresses = OrderShippingAddresses.new(ordershipping_address_params)
    if @ordershipping_addresses.valid?
      pay_item
      @ordershipping_addresses.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

    before_action :@item = Item.create(item_params), only: [:index, :create]

  def ordershipping_address_params
    params.require(:order_shipping_addresses).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item[:price],
      card: ordershipping_address_params[:token],
      currency: 'jpy'
    )
  end

end
