class Admin::CartsController < ApplicationController
	layout 'admin'
	before_filter :authenticate_admin, only: [:edit, :update, :destroy]
  
  def index
    @carts = Cart.all
  end

  def show
    if session[:cart_id].nil?
      flash[:notice] = "You haven't create cart!"
      redirect_to root_path
    else
      @cart = current_cart
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
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end
end
