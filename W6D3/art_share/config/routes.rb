Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end

  resources :artworks, only: [:show, :update, :destroy, :create] do
    resources :comments, only: [:index]
  end

  resources :artwork_shares, only: [:destroy, :create]
  resources :comments, only: [:destroy, :create]
  resources :likes, only: [:destroy, :create]

end
