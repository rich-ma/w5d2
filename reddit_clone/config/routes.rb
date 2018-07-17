Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :subs do
    resources :posts, only: [:new, :create]
  end
  
  resources :posts, only: [:edit, :update, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
