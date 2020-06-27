class ApplicationController < ActionController::Base
# deviseコントローラにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :organizer?, :guest?

  def guest?(event)
    event.user != current_user
  end
  def organizer?(event)
    event.user == current_user
  end



  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end

  protected
  def configure_permitted_parameters
    added_attrs = [ :nickname, %i(image)]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs )
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

end



## registrations_controller
#  def check_guest
#    if resource.email == 'guest@example.com'
#      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
#    end
#  end

## passwords_controller
#  def check_guest
#    #if resource.email == 'guest@example.com'
#    # ログインする前のものを制御  (downcaseは大文字小無視)
#    if params[:user][:email].downcase == 'guest@example.com'
#      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
#    end
#  end