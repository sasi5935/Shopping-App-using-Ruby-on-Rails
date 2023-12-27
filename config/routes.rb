Rails.application.routes.draw do
  root to:'home#show'
  devise_for :users
  post 'favorites/create'
  delete 'favorites/destroy'

  get 'cushion_filters', to: 'home#cushion_filters'
  get 'home', to: 'cushions#home', as: 'home'
  get 'favorite_cushions', to: 'cushions#favorite'
  get 'cart', to: 'carts#show', as: 'cart'
  get 'checkout', to: 'checkout#show'
  get 'order_success', to: 'checkout#success'
  post 'checkout/confirm', to: 'checkout#confirm', as: 'confirm_checkout'

  resources :cushions
  resources :favorites, only: [:create, :destroy]
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  scope '/home' do
    get 'view/:id', to: 'cushions#show', as: 'home_cushion'
    resources :purchase_histories, only: [:index, :show]
  end


  resources :stories do
    resources :comments, only: [:create, :destroy]
    post 'like', on: :member
    delete 'unlike', on: :member
  end

  get 'home/emoji_storytelling', to: 'stories#index', as: :emoji_storytelling
  resources :captions do
    resources :votes, only: [:create, :destroy]

  end
  get 'home/caption_battle', to: 'captions#index', as: :caption_battle

end
