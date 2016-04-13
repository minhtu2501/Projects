class OrderItemsController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :edit, :update]
  def index
    @order_items = OrderItem.paginate(page: params[:page])
  end

  def show
    @order_item = OrderItem.find(params[:id])
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def create
   @product = Product.find(params[:product_id])
    if @product.number == 0 || @product.number.nil?
      flash[:notice] = "We are runing out of this item!"
      redirect_to category_path(@product.category.id)
    elsif OrderItem.exists?(cart_id: current_cart.id, product_id: @product.id)
      item = OrderItem.find_by(cart_id: current_cart.id, product_id: @product.id)
      if (item.quantity + 1) <= @product.number
        OrderItem.update(item.id, quantity: item.quantity + 1)
        redirect_to @current_cart
      else
        flash[:notice] = 'This is limit of this item!'
        redirect_to category_path(@product.category.id)
      end
    else  
     @order_item = OrderItem.create!(cart: current_cart, product: @product, quantity: 1, unit_price: @product.price)
     redirect_to @current_cart
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path(current_cart.id)
  end
end
