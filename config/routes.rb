Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
  end

  resources :items do
    resources :records, only: [:create, :index]
  end

  #get 'items/search'
end
