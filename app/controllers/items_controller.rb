class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]

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

  def update
    @item = Item.find(params[:id])
  
    if @item.update(item_params) && @item.previous_changes.any?
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  
  def edit
  end

  private

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

  def move_to_index
    if params[:id]
      @item = Item.find(params[:id]) 
      unless user_signed_in? && current_user == @item.user
        redirect_to action: :index
      end
    else
      unless user_signed_in?
        redirect_to action: :index
      end
    end
  end
end
  def set_item
    @item = Item.find(params[:id])
  end