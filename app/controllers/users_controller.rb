require 'pagy'
include Pagy::Backend

class UsersController < ApplicationController
  def index
    page = params['page'].to_i || 1
    if page == 0
      page = 1
    end
    @pagy, @users = pagy(User.all, items: 2, page: page)
    render 'index'
  end

  def show
    @user = User.find(params["id"])
    render "show"
  end
end
