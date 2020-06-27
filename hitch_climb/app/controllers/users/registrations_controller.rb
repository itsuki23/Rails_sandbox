class Users::RegistrationsController < Devise::RegistrationsController
  # guest user が削除されると２名以上のゲストがいた時に両方が強制的にログアウトされるのを防ぐため
  before_action :check_guest, only: %i[update destroy]
end
