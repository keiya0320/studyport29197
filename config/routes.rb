Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_infos', to: 'users/registrations#new_user_info'
    post 'user_infos', to: 'users/registrations#create_user_info'
  end

  resources :posts, only: [:index, :new, :create, :destroy] do
    collection do
      get 'search'
    end
  end

  root to: "home#index"
end
