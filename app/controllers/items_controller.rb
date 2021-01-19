class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.user == current_user
      item.destroy
      redirect_to root_path
    else 
      redirect_to item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :charges_id, :area_id, :schedule_id, :explanation,
                                 :image).merge(user_id: current_user.id)
  end
end
