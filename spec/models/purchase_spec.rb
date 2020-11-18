require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
  it 'tokenがあれば保存ができること' do
    expect(@purchase).to be_valid
  end
  it 'tokenが空では登録できないこと' do
    @purchase.token = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
  it 'userモデルが結びついてないと登録できないこと' do
    @purchase.user = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
  it 'itemモデルが結びついてないと登録できないこと' do
    @purchase.item = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Token can't be blank")
  end
end
