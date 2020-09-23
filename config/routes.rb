Rails.application.routes.draw do

  get 'cards/new'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_infos', to: 'users/registrations#new_user_info'
    post 'user_infos', to: 'users/registrations#create_user_info'
  end

  resources :posts, only: [:index, :new, :create, :destroy, :show] do
    collection do
      get 'search'
    end
    
    resources :comments, only: :create
    
  end

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]

  root to: "home#index"
end
