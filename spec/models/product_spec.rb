require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "全ての必須項目が入力されていれば保存できる" do
        expect(@product).to be_valid
      end
    end

    context "商品が登録できない場合" do
      it "出品画像を選択しなければ保存できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がなければ保存できない" do
        @product.product_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it "商品名は40字以内まで" do
        @product.product_name = "a" * 41
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
      end
      it "商品説明がないと保存できない" do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it "商品説明は1000字以内まで" do
        @product.description = "a" * 1001
        @product.valid?
        expect(@product.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it "カテゴリーの選択は必須" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category selection is mandatory")
      end
      it "商品の状態の選択は必須" do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status selection is mandatory")
      end
      it "配送料の負担の選択は必須" do
        @product.shipping_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge selection is mandatory")
      end
      it "発送元の地域の選択は必須" do
        @product.shipping_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area selection is mandatory")
      end
      it "発送までの日数の選択は必須" do
        @product.days_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days ship selection is mandatory")
      end
      it "販売価格がなければ保存できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格は300円以上" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "販売価格は9,999,999円以下" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end