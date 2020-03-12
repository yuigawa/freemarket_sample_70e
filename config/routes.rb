Rails.application.routes.draw do
  root 'tops#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :items
  resources :tops
  resources :products, only: [:index, :show, :new, :edit, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end