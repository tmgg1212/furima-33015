class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item2, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.order != nil
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

  def set_item2
    @item = Item.find(params[:item_id])
  end

  def ordershipping_address_params
    params.require(:order_shipping_addresses).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
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
