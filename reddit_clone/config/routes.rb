Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  
  resources :subs do
    resources :posts, only: [:new, :create, :edit, :update]
  end
  
  resources :posts do
    resources :comments, only: [:new]
  end
  
  resources :comments, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
