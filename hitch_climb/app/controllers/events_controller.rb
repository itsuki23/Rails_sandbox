class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    #@events = Event.all.order(:id)
    @events = Event.page(params[:page]).per(8)
  end


  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path, notice:  "新規投稿しました。"
    else
      redirect_to new_event_path, alert: "新規投稿に失敗しました。"
    end

    #@event = Event.create!(event_params)
    #@event.user_id = current_user.id
    #@event.save
    #redirect_to events_path, notice: "新規投稿しました。"
    # ~文字以上のバリデーションのエラー文はどう表示するのか…後ほど調べる
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.user
    @comment = current_user.comments.build
    @comments = @event.comments.page(params[:page]).per(10)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to events_path, notice: "投稿を削除しました。"
  end

  def update
    @event = Event.find(params[:id])
    @event.update!(event_params)
    redirect_to events_path, notice: "投稿を編集しました。"
  end

  private
  def event_params
    params.require(:event).permit(:head, :body, :image, :start_time) #:user_idは指定しない！
  end

  def ensure_correct_user
    @event = Event.find(params[:id])
    @user = @event.user
    if @user != current_user
      flash[:alert] = "権限がありません"
      redirect_to root_path
    end
  end

end
