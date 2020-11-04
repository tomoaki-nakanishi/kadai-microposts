class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:post_id])
    current_user.favorite(micropost)
    flash[:success] = 'いいねしました。'
    redirect_to request.referer
  end

  def destroy
    micropost = Micropost.find(params[:post_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'いいねを解除しました。'
    redirect_to request.referer
  end
end
