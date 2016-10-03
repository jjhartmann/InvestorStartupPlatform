Rails.application.routes.draw do

  resources :meetings
  resources :messages do
    collection do
      get 'inbox'
    end
  end
  resources :offers

  get 'proposals/download'

  resources :proposals do
    get 'view_proposal'
  end

  resources :enterprises do
    collection do
      get 'add_member'
      post 'add_member'
      get 'public_profile'
    end
  end
  resources :news_feeds
  resources :notifications do
    member do
      post 'dismiss'
    end
  end
  resources :user_dashboards do
    collection do
      get 'all_users'
      get 'follow_unfollow_user'
      get 'suggested_profile'
      get 'connections'
      get 'network'
    end
  end
  resources :user_profiles do
    collection do
      post 'meeting_request'
    end
  end
  resources :questionaries do
    collection do
      post 'save_questions'
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

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
