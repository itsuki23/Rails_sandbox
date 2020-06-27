Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: {
      # 編集や削除防止のための始めの手順、後、コントローラー作成編集
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }

  # usersではないのか？↓
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # それぞれの一覧ページを作るときのメソッド
    get :followers, on: :member
  end


  resources :messages

  resources :events do   # group easy to get foreign_key(user_id)
    # no need [:id] => singlar (resources ✖︎︎, resource ○)
    resource :favorites, only: [:create, :destroy]
    resource :entries, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  resource :comments, only: [:create, :destroy]


end
