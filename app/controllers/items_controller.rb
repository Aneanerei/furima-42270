class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
 
  def index
    @items = Item.includes(:user).order(created_at: :desc)
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
  end
  
  def edit
    if @item.sold_out? 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params) && @item.previous_changes.any?
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
      unless current_user == @item.user
      redirect_to action: :index
      end
  end
  
  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :condition_id,
      :shipping_fee_payer_id,
      :prefecture_id,
      :shipping_schedule_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

 

 

end