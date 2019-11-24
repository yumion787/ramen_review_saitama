class ToppagesController < ApplicationController
  def index
    if logged_in?
      @store = current_user.stores.build  # form_with 用
      @stores = current_user.stores.order(id: :desc).page(params[:page])
    end
  end
end
