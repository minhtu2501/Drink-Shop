class CartsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy]
  
  def index
    @carts = Cart.all
  end

  def show
    if session[:cart_id].nil?
      flash[:notice] = "You haven't create cart!"
      redirect_to '/'
    else
      @cart = current_cart
      @order_items = @cart.order_items
    end
  end

  def detail_show
    @cart = Cart.find(params[:cart_id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:cart])
  end

  def update
    @cart = Cart.find(params[:id])
    binding.pry
    @cart.order_items.each do |order_item|
      order_item.update_attribute(:quantity)
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end
end
