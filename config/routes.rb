Rails.application.routes.draw do
  
  resources :presentations, except: [:index, :new]
  resources :activities do
    resources :presentations, only: [:index, :new]
  end
  
  devise_for :users
  resources :users
  
  get 'welcome/index'
  root 'welcome#index'
end
