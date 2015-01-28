class StaticPagesController < ApplicationController
  # layout "static"

  def index
  end

  def contact
	end

	def thank_you
		# @name = params[:name]
	 #  @email = params[:email]
	 #  @message = params[:message]
  # 	ActionMailer::Base.mail(:from => 'no-reply@example.com', 
	 #  	:to => @email, 
	 #  	:subject => "A new contact form message", 
	 #  	:body => @message).deliver
  # 	flash[:notice] = "Your message has been delivered."
  # 	render "static_pages/contact"
	end

  def landing_page
  	@featured_product = Product.first
  end
end
