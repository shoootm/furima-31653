require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do
    context 'コメントがうまくいくとき' do
      it '全て正常' do
        expect(@comment.valid?).to eq true
      end
    end

    context 'コメントがうまくいくとき' do
      it 'commentが空ではコメントできない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐づいていないとコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'itemが結びついていないとコメントできない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
