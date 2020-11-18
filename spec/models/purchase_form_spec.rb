require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe 'ユーザー新規登録' do
    context '商品出品がうまくいくとき' do
      it '全て正常' do
        expect(@purchase_form.valid?).to eq true
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @purchase_form.postal_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンがないと登録できない' do
        @purchase_form.postal_code = "1234567"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'area_idが空では登録できない' do
        @purchase_form.area_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1では登録できない' do
        @purchase_form.area_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Area must be other than 1")
      end
      it 'municipalitiesが空では登録できない' do
        @purchase_form.municipalities = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では登録できない' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁の数字でなければ登録できない' do
        @purchase_form.phone_number = "ttttttttt"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


