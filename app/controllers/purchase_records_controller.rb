class PurchaseRecordsController < ApplicationController
    def index
    @product = Product.find(params[:product_id])
    @purchase_records = PurchaseUser.new
  end

  def new
  end
  
end
