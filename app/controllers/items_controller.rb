class ItemsController < ApplicationController
  def index

  end

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :shipping_charges_id, :area_id, :shipping_date_id :image).merge(user_id: current_user.id)
  end
end
