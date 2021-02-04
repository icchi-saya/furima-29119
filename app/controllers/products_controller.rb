class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def products_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_ship_id, :price, :user_id).merge(user_id: current_user.id)
  end

end
