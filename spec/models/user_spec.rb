require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

    context 'ユーザー新規登録ができる時' do
     it "すべての項目が記載されていれば登録できる" do
      expect(@user).to be_valid
     end
    end
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailは@を含む必要があること" do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordは6文字以上での入力が必須であること" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordは半角英数字混合での入力が必須であること" do
      @user.password = "００００００"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "passwordとpassword（確認用）、値の一致が必須であること" do
      @user.password = "000aaa"
      @user.password_confirmation = "aaa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "全角では登録できないこと" do
      @user.password = "０００あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "半角英語のみでは登録できないこと" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = ""
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid", "Last name can't be blank", "Last name is invalid")
     end
     it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "000aaa"
      @user.last_name = "aaa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
     end
     it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.first_name_kana = ""
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid", "Last name kana can't be blank", "Last name kana is invalid")
     end
     it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = "000aaa"
      @user.last_name_kana = "aaa000"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
     end
     it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
  end
end