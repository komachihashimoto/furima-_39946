require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_furiganaとfirst_name_furigana、dobが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end 
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end 
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end 
    it 'last_name_furiganaが空では登録できない' do
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
    end 
    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'dobが空では登録できない' do
      @user.dob = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Dob can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = '11111111'
      @user.password_confirmation ='11111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end 
    it 'passwordが全角では登録できない' do
      @user.password = 'aaaああああ'
      @user.password_confirmation = 'aaaああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it '半角文字が含まれていると登録できない' do
      @user.last_name = 'ああaああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it '半角文字が含まれていると登録できない' do
      @user.first_name = 'ああaああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'カタカナ以外の文字が含まれていると登録できない' do
      @user.last_name_furigana = 'ア亜あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
    end
    it 'カタカナ以外の文字が含まれていると登録できない' do
      @user.first_name_furigana = 'ア亜あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana is invalid")
    end
  end
 end
end