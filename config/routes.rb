Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get('/ideas', { to: 'ideas#index'})
  root 'ideas#index'
  
  resources :ideas do
  resources :reviews, only: [:create, :update, :destroy]
  end
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resource :session, only: [:new, :create, :destroy]
end
