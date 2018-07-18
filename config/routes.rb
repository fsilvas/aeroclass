Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks' 


  }

  devise_scope :user do 
    get '/reset_password' => 'users#resetPassword'
    post '/reset_password' => 'users#resetPassword'
    get '/signout', to: 'users/sessions#destroy', as: :signout
      authenticated :user do
        root :to => 'static#home'
      end
      unauthenticated :user do
        root :to => 'devise/sessions#new'
      end
      root :to => 'static#home'
  end

  get 'all_users' => 'users#index', as: :index_users
  get 'all_users/new' => 'users#new', as: :new_user
  get 'all_users/:id' => 'users#show', as: :single_user
  post 'all_users' => 'users#create', as: :all_users
  get 'all_users/:id/edit' => 'users#edit', as: :edit_user
  patch 'all_users/:id' => 'users#update'
  put 'all_users/:id' => 'users#update', as: :update_user
  delete 'all_users/:id' => 'users#destroy', as: :delete_user

  root to: "static#index"
end
