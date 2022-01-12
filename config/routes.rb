Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index'
  end

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'

  devise_for :admins
  devise_for :members
  
  root 'site/home#index'
end
