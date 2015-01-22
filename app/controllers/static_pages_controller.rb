class StaticPagesController < ApplicationController
  # layout "static"

  def index
  end

  def landing_page
  	@featured_product = Product.first
  end
end
