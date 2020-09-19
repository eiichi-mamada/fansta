class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = 'コメントしました。'
      redirect_to post_path(params[:post_id])
    else
      flash.now[:danger] = 'コメントに失敗しました。'
      @post = Post.find(params[:post_id]) 
      @message = Message.new(post_id: @post.id)
      @messages = Message.where(post_id: @post.id).includes(:user).order(id: :desc)
      render "posts/show"
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.user == current_user
      @message.destroy
      flash[:success] = 'コメントを削除しました。'
      redirect_to post_path(params[:post_id])
    else
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
