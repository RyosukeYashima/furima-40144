require 'rails_helper'

RSpec.describe ShoppingForm, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @shopping_form = FactoryBot.build(:shopping_form, user_id: @user.id, item_id: @item.id)
    end

    context '正常系' do
      it '全ての必須項目を正しく入力した場合、商品が有効であること' do
        expect(@shopping_form).to be_valid
      end

      it '建物名が空の場合でも、有効であること' do
        @shopping_form.building_name = nil
        expect(@shopping_form).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が空の場合、無効であること' do
        @shopping_form.post_code = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '無効な郵便番号形式の場合、無効であること' do
        @shopping_form.post_code = '1234567'
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Post code は「3桁ハイフン4桁」の形式で入力してください")
      end

      it '配送元の選択が空の場合、無効であること' do
        @shopping_form.shipping_from_id = 1
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Shipping from can't be blank")
      end

      it '市区町村が空の場合、無効であること' do
        @shopping_form.municipality = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空の場合、無効であること' do
        @shopping_form.street_address = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空の場合、無効であること' do
        @shopping_form.phone_number = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下の場合、無効であること' do
        @shopping_form.phone_number = '123456789'
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it '電話番号が12桁以上の場合、無効であること' do
        @shopping_form.phone_number = '123456789012'
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'クレジットカード情報が空の場合、無効であること' do
        @shopping_form.token = ''
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが空の場合、無効であること' do
        @shopping_form.user_id = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("User can't be blank")
      end

      it '商品が空の場合、無効であること' do
        @shopping_form.item_id = nil
        @shopping_form.valid?
        expect(@shopping_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
