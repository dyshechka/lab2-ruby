Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'products/index'
  post 'products/add_item'
  get 'orders/index'
  post 'orders/done'
  root 'products#index'
end
