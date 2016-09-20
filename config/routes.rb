Rails.application.routes.draw do

  resources :notifications
  resources :user_dashboards
  resources :user_profiles
  resources :questionaries do
    collection do
      get 'save_questions'
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  resources :home_pages do
    collection do
      get 'faq'
      get 'about'
      get 'services'
    end
  end

  get 'hello_world/test'

  namespace :home do
    get 'home_page/index'
    get 'home_page/features'
    get 'home_page/showInvestors'
    get 'home_page/showStartups'
    get 'home_page/trending'
  end

  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home_pages#index'
end
