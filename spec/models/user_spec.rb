require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname、email、passwordとpassword_confirmation、first_name、family_name、first_name_kana、family_name_kana、birthが存在すれば登録できる" do

      end
      it "emailに@が含まれていればで登録できる" do
        @user.email = "sample@sample.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "123qaa"
        @user.password_confirmation = "123qaa"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "111qqq"
        @user.password_confirmation = "111qqq"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが同じであれば登録できる" do
        @user.password = "111qqq"
        @user.password_confirmation = "111qqq"
        expect(@user).to be_valid
      end
      it "first_nameとfamily_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.first_name = "佐藤"
        @user.family_name = "太朗"
        expect(@user).to be_valid
      end
      it "first_name_kanaとfamily_name_kanaが全角（カタカナ）であれば登録できる" do
        @user.first_name_kana = "サトウ"
        @user.family_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "123qa"
        @user.password_confirmation = "123qa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英字だけでなければ登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end
      it "passwordが半角数字だけでなければ登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "fff"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）を使用してください")
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "fff"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角（漢字・ひらがな・カタカナ）を使用してください")
      end
      it "first_name_kanaが空では登録できないい" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "family_name_kanaが空では登録できないい" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "伊藤"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角（カタカナ）を使用してください")
      end
      it "family_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana 全角（カタカナ）を使用してください")
      end
      it "birthが空では登録できないい" do
        @user.birth = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
