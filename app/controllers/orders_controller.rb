class OrdersController < ApplicationController

  def index
    @ordershipping_addresses = OrderShippingAddresses.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @ordershipping_addresses = OrderShippingAddresses.new(ordershipping_address_params)
    if @ordershipping_addresses.valid?
      @ordershipping_addresses.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def ordershipping_address_params
    params.require(:order_shipping_addresses).permit(:postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: @item.id)
  end
end
