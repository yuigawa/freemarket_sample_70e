Rails.application.routes.draw do
  root 'tops#index'
  
  devise_for :users
  resources :items
  resources :tops
  resources :products, only: [:index, :show, :new, :edit, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
end
end