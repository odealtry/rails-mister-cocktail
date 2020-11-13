Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:new, :show, :create, :index] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:index, :destroy]
end
