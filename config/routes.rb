Rails.application.routes.draw do
  
  namespace :backoffice do
  get 'admins/index'
  end

  get 'backoffice', to: 'backoffice/dashboard#index'
  
  namespace :backoffice do
    resources :categories, except: [:show]
    resources :admins, except: [:show]
    resources :send_mail, only: [:edit, :create]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
  end

  devise_for :admins, skip: [:registrations]

  devise_for :members
  
  root 'site/home#index'
end
