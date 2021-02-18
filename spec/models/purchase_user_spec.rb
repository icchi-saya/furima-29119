require 'rails_helper'

RSpec.describe PurchaseUser, type: :model do
  before do
    @purchase_user = FactoryBot.build(:purchase_user)
  end

  describe '商品の購入' do
    context "商品が購入できる場合" do
      it "全ての必須項目が入力されていれば保存できる" do
        expect(@purchase_user).to be_valid
      end
    end

    context "商品が購入できない場合" do
      it "郵便番号を入力しなければ購入できない" do
        @purchase_user.postal_code = ""
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号は数字とハイフンの入力が必須" do
        @purchase_user.postal_code = "123"
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県の入力は必須" do
        @purchase_user.prefectures_id = 1
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Prefectures selection is mandatory")
      end

      it "市区町村の入力は必須" do
        @purchase_user.city = ""
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("City can't be blank")
      end

      it "番地の入力は必須" do
        @purchase_user.house_number = ""
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("House number can't be blank")
      end

      it "電話番号の入力は必須" do
        @purchase_user.phone_number = ""
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Phone number can't be blank")
      end

      it "電話番号の入力にハイフンは不要" do
        @purchase_user.phone_number = "090-9876-5432"
        @purchase_user.valid?
        expect(@purchase_user.errors.full_messages).to include("Phone number Half-width numbers only")
      end
    end
  end
end
