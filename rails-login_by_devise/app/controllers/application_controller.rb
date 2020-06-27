class ApplicationController < ActionController::Base

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
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


end
