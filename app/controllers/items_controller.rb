class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comments = Comment.all
    @comment = Comment.new
  end

  def edit
    redirect_to action: :index if current_user.id != @item.user_id || @item.purchase.present?
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :shipping_charge_id, :area_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
