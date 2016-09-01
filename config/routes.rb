Rails.application.routes.draw do

  namespace :admin do
    resources :users
resources :enterprises
resources :enterprise_photos
resources :enterprise_users
resources :investor_profiles
resources :messages
resources :proposals
resources :questions
resources :questionaires
resources :target_followers
resources :user_profiles

    root to: "users#index"
  end

  devise_for :users

  resources :home_pages do
    collection do
      get 'faq'
      get 'about'
      get 'services'
    end
  end

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
