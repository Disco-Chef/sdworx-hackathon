Rails.application.routes.draw do
  get 'profiles/new'
  devise_for :users
  root to: 'pages#home'
  resources :profiles, except: [:show, :edit]
  resources :chosen_visions, only: [:create, :update]
  resources :chosen_strategies, only: [:create, :update]
  resources :bad_guys, only: [:create, :update]
  resources :quests, only: [:create, :update]
  resources :power_ups, only: [:create, :update]
  get 'adventures', to: "pages#adventure", as: :adventure
  get 'profile', to: "profiles#new", as: :main_profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
