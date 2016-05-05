class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.paginate(page: params[:page]).order("created_at DESC")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order_item = OrderItem.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @cart = Cart.find(session[:cart_id])
    respond_to do |format|
    if @cart.order_items.each do |item|
        product = Product.find(item.product.id)
        if item.quantity <= product.number
          Product.update(item.product.id, number: product.number - item.quantity)
        else
          flash[:notice] = 'Item <% product.name %> is runing out.'
          redirect_to category_path(product.category.id)
        end
      end
        @order.save
        session[:cart_id] = nil
        Order.update(@order.id, status: 'Waiting Process..')

        format.html { redirect_to @order, notice: 'Order was successful.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cart_id, :custome_name, :email, :mobile, :address, :status)
    end
end
