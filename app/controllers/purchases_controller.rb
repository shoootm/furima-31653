class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_form = PurchaseForm.new
    redirect_to items_path if user_signed_in? && current_user.id == @item.id || @item.purchase.present?
  end

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :area_id, :municipalities, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
