Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :order_price
  resources :revenue
  resources :unit_sales
end
