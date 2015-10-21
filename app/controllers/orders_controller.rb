class OrdersController < ApplicationController
	#skip_before_filter  :verify_authenticity_token MAKES it vulnurable for attacks
	protect_from_forgery with: :null_session
	respond_to :json, :html

	def index
		@orders = Order.all.to_json(:include => [{:product => {:only => :name}}, {:user => {:only => :email}}])
		respond_with @orders
	end

	def show
		@order = Order.find(params[:id]).to_json(:include => [{:product => {:only => :name}}, {:user => {:only => :email}}])
		respond_with @order
	end

	def new
	end

	def create
		@order = Order.create(order_params)
		respond_with @order
	end

	# def update
	# 	respond_with Order.update(params[:id], params[:order])
	# end

	def destroy
		respond_with Order.destroy(params[:id])
	end

	private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :total)
  end

end
