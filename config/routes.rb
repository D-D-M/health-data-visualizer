Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user_queries, except: [:index, :edit, :update, :destroy]
  resources :users
end
