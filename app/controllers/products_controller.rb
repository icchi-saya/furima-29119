class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :seller_only, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @product.update(products_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def products_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :days_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def seller_only
    return redirect_to root_path if current_user.id != @product.user.id  
  end

end