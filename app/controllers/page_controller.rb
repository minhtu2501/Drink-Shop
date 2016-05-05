class PageController < ApplicationController
  def home
    @products = Product.paginate(page: params[:page])
    @recent_products = Product.recent
    @top_seller_products = Product.top_seller
    @top_deals = Product.top_deal
  end

  def about
  end

  def faqs
  end

  def contact
  end
end
