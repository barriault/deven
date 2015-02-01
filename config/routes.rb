Rails.application.routes.draw do
  
  resources :programs
  
  devise_for :users
  resources :users
  
  get 'welcome/index'
  root 'welcome#index'
end
