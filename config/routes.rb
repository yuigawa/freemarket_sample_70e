Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :tops
  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users
  resources :item_images
  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
  resources :posts do
      post 'add', to: 'favorites#create'
      delete '/add', to: 'favorites#destroy'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end