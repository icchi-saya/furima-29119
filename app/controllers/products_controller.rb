class ProductsController < ApplicationController
  def index
    @product = Product.order("created_at DESC")
  end

  #def new
  #  @product = Product.new
  #end
  
  def create
    @product = Product.create
  end

  private

  def products_params
    params.require(:product).permit(:conrent, :image, :category_id, :states_id, :shipping_charge_id, :shipping_area_id, :days_ship_id).merge(user_id: current_user.id)
  end
end
