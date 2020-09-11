class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.favorite(current_user)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])
    post.unfavorite(current_user)
    flash[:success] = 'お気に入りの登録を解除しました。'
    redirect_to post
  end
end
