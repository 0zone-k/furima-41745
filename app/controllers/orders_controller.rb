class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :order_address_new, only: [:index, :new]

  def index
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path(@order_address)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:item_id, :user_id, :post_cord, :prefecture_id, :city, :banchi, :apt_name, :tel_num).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_address_new
    @order_address = OrderAddress.new
  end
end
