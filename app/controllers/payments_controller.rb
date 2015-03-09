class PaymentsController < ApplicationController

	def create

	  stripe_customer = Stripe::Customer.create(
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => stripe_customer.id,
	    :amount      => params[:amount],
	    :description => 'My Description',
	    :currency    => 'USD'
	  )
	end

end
