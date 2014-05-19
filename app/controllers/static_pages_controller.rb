class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @offer  = current_user.offers.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def add
  	if signed_in?
      @offer  = current_user.offers.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
