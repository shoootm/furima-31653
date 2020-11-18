class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
    if user_signed_in? && current_user.id == @item.id
      redirect_to items_path
    end
    if @item.purchase.present?
      redirect_to items_path
    end
  end
  def create
    @item = Item.find(params[:item_id])
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
    params.require(:purchase_form).permit(:postal_code, :area_id, :municipalities, :address, :building, :phone_number ).merge( item_id: params[:item_id],user_id: current_user.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
