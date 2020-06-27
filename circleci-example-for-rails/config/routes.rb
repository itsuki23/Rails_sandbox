Rails.application.routes.draw do
  resources :articles
  resources :users, defaults: { format: :json }
end
