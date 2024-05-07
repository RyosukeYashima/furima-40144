require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    # バリデーションが正常に機能する場合をテストする
    context 'バリデーションが正常に機能する場合' do
      it '全ての必須項目を正しく入力した場合、ユーザーが登録できること' do
        expect(@user).to be_valid
      end
    end
    

    # バリデーションが失敗する場合をテストする
    context 'バリデーションが失敗する場合' do
      it 'nicknameが空の場合、ユーザーは登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空の場合、ユーザーは登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが重複している場合、ユーザーは登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合、ユーザーは登録できないこと' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空の場合、ユーザーは登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字未満の場合、ユーザーは登録できないこと' do
        @user.password = 'short'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードが半角数字のみの場合、ユーザーは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      it 'パスワードが半角英字のみの場合、ユーザーは登録できないこと' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      it 'パスワードに半角英数字以外の文字が含まれている場合、ユーザーは登録できないこと' do
        @user.password = 'password123!'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end

      it 'passwordとpassword_confirmationが一致しない場合、ユーザーは登録できないこと' do
        @user.password_confirmation = 'password456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)の名字が空の場合、ユーザーは登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)の名前が空の場合、ユーザーは登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前(全角)の名字が全角文字でない場合、ユーザーは登録できないこと' do
        @user.last_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角文字で入力してください")
      end

      it 'お名前(全角)の名前が全角文字でない場合、ユーザーは登録できないこと' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字で入力してください")
      end

      it 'お名前カナ(全角)の名字が空の場合、ユーザーは登録できないこと' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it 'お名前カナ(全角)の名前が空の場合、ユーザーは登録できないこと' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'お名前カナ(全角)の名字が全角カタカナでない場合、ユーザーは登録できないこと' do
        @user.kana_last_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name は全角カタカナで入力してください")
      end

      it 'お名前カナ(全角)の名前が全角カタカナでない場合、ユーザーは登録できないこと' do
        @user.kana_first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name は全角カタカナで入力してください")
      end

      it '生年月日が空の場合、ユーザーは登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
