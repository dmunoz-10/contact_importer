Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :contacts, only: %i[new create]
  resources :log_files, only: :show do
    resources :upload_errors, only: :index, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
