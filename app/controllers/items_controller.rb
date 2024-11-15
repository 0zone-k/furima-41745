class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @order = Order.find_by(item_id: @item.id)
  end

  private

  def item_params
    params.require(:item).permit(:title, :introduction, :user, :price, :prefecture_id, :postage_id,
                                 :shopping_date_id, :category_id, :situation_id, :image).merge(user_id: current_user.id)
  end
end
