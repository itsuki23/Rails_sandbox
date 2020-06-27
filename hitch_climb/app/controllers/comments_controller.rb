class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    comment = current_user.comments.build(comment_params) # comment.user_id = current_user.id
    comment.event_id = event.id
    if comment.save
      flash[:success] = "コメントしました"
      redirect_to event_path(event.id)
    else
      flash[:success] = "コメントできませんでした"
      redirect_to event_path(event.id)
    end
  end

  def destroy
    comment = Comment.find_by(event_id: params[:event_id], user_id: current_user.id)
    comment.destroy
    redirect_to event_path(event.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end


