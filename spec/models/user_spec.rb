require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザ登録ができる時' do
    it '全ての情報がある場合登録できる' do
      expect(@user).to be_valid
    end
  end
    
  context 'ユーザ登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end

    it 'emailが被っていた場合は登録できない（一意性）' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it '@がない場合は登録できない' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end

    it 'passwordが空の場合は登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '111aa'
      @user.password_confirmation = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英語のみは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password を半角英数字で入力してください")
    end

    it 'passwordが数字のみは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password を半角英数字で入力してください")
    end
    
    it 'passwordが全角英数混合は登録できない' do
      @user.password = 'ａａ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password を半角英数字で入力してください")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '111aaa'
      @user.password_confirmation = '111aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it '姓が空の場合は登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end

    it '姓が全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name 全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it '名が空の場合は登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end

    it '名が全角（漢字・ひらがな・カタカナ）以外は登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name 全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it '姓（フリガナ）が空の場合は登録できない' do
      @user.last_name_canat = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name canat can't be blank")
    end

    it '姓（フリガナ）が全角（カタカナ）以外は登録できない' do
      @user.last_name_canat = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name canat 全角（カタカナ）で入力してください")
    end

    it '名（フリガナ）が空の場合は登録できない' do
      @user.first_name_canat = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name canat can't be blank")
    end

    it '名（フリガナ）が全角（カタカナ）以外は登録できない' do
      @user.first_name_canat = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name canat 全角（カタカナ）で入力してください")
    end

    it '誕生日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end

end
end