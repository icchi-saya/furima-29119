class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]
  #before_action :buyer_only, only: [:index]
  #before_action :sold_out, only: [:index]
  

  def index
    return redirect_to root_path current_user.id == @product.user.id || @product.purchase_record
    @purchase_user = PurchaseUser.new
  end

  def new
  end
  
  def create
    @purchase_user = PurchaseUser.new(purchase_params)
    if @purchase_user.valid?
      pay_product
      @purchase_user.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def purchase_params
    params.require(:purchase_user).permit(:postal_code, :prefectures_id, :city, :house_number, :apartment, :phone_number).merge(product_id: params[:product_id],user_id: current_user.id,token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price, 
      card: purchase_params[:token], 
      currency: 'jpy'                
    )
  end

  #def buyer_only
   # return redirect_to root_path if current_user.id == @product.user.id  
  #end

  #def sold_out
    #return redirect_to root_path if @product.purchase_record
  #end
end
