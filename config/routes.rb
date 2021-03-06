require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
  resources :log_files, only: %i[new create show] do
    resources :upload_errors, only: :index, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
