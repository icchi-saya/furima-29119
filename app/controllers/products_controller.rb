class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.all.order("created_at DESC")
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

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(products_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  private

  def products_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

end