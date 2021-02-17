class PurchaseRecordsController < ApplicationController
    def index
    @product = Product.find(params[:product_id])
    @purchase_user = PurchaseUser.new
  end

  def new
    @purchase_user = PurchaseUser.new
  end
  
  def create
    @purchase_user = PurchaseUser.new(purchase_params)
    if @purchase_user.valid?
    @purchase_user.save
    redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_user).permit(:postal_code, :prefectures_id, :city, :house_number, :apartment, :phone_number).merge(product_id: params[:product_id],user_id: current_user.id)
  end

end


#paramsの受け取り

#paramsの形
#1. 一重のparams    parameters: {:name => "tanaka", :address => "osaka"}
# params.permit(:name, :address)

#paramsの形
#3. 二重のparams    parameters: {:user => {:name => "tanaka", :address => "osaka"}}
# params.require(:user).permit(:name, :address)

#paramsの形
#3. 複合のparams    parameters: {:user => {:name => "tanaka", :address => "osaka"}, :token => "tok_1234"}
# params.require(:user).permit(:name, :address).merge(token: params[:token])