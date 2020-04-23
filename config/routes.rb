Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # devise_scope :user do
  #   get "profile_edit", to: "users/registrations#profile_edit", as: "profile_edit"
  #   patch "profile_update", to: "users/registrations#profile_update", as: "profile_update"
  # end

  root 'home#top'
  get 'home/about', to: 'home#about'
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  get "user/:id/likes", to: "users#likes", as: "user_likes"
end
