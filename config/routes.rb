Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'products#index'
  resources :products, only: [:index, :show]
  resource  :contacts, only: [:show]
  resource  :abouts, only: [:show]
  resource  :terms, only: [:show]
  
  resource  :orders, only: [:index, :create, :show] do
    get :express_checkout
    get :review
    get :purchase
  end
  resource  :user, only: [:show, :update]

  resource :cart, only: [:show] do
    post "add", path: "add/:id"
    get :checkout
    post "remove_item", path: "remove_item/:id"
  end
end