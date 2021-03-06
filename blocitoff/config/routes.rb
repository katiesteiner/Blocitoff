Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :show, :index] do
    resources :items, only: [:create, :destroy, :update]
  end
  get 'welcome/about'

  root to: 'welcome#index'
end
