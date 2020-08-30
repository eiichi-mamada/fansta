class PostsController < ApplicationController
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    
    if  @post.save
      flash[:success] = '投稿しました。'
      redirect_to current_user
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :coment, :team_id)
  end
end
