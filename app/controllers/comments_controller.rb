class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to product_path(@product)
  end

	def destroy
		comment = Comment.find(params[:id])
		product = comment.product
		comment.destroy
		redirect_to products_path(product)
	end

	private
    
    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end
