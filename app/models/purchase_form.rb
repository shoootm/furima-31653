class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipalities, :address, :building, :phone_number, :token, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
    validates :token
  end
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
