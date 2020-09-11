class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if  @post.save
      flash[:success] = '投稿しました。'
      redirect_to action: :show, id: @post.id
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = '正常に更新されました'
      redirect_to @post
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to controller: :users, action: :show, id: current_user.id
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :coment, :team_id)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
