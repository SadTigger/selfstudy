Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orders, only: [:show, :create, :delete]
  # get :orders, to: "orders#index"
  # get "orders/:id", to: "orders#show"
  # get "orders/:id", to: "orders#update"
  # post :create_order, to: "orders#create"
  # put :put_order, to: "orders#update"
  # delete :delete_order, to: "orders#delete"
end
