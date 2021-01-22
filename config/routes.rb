Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
   resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
   resources :users, only: [:show, :index, :edit, :update]
end
