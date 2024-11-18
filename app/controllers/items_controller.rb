class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :move_to_index, expect: [:index, :edit]

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
    # @order = Order.find_by(item_id: @item.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :introduction, :user, :price, :prefecture_id, :postage_id,
                                 :shopping_date_id, :category_id, :situation_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in? && current_user.id != Item.name

    redirect_to action: :index
  end
end
