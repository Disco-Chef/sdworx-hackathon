Rails.application.routes.draw do
  get 'profiles/new'
  devise_for :users
  root to: 'pages#home'
  resources :profiles, except: [:show, :edit]
  resources :chosen_visions, only: [:create, :update]
  resources :chosen_strategies, only: [:create, :update]
  get 'profile', to: "profiles#new", as: :main_profile

  resources :dashboard, only: :index
  patch "defeat_bad_guy/:id", to: "dashboard#defeat_bad_guy", as: :defeat_bad_guy
  patch "increase_power_up/:id", to: "dashboard#increase_power_up", as: :increase_power_up
  patch "change_completion_rate/:id", to: "dashboard#change_completion_rate", as: :change_completion_rate
end
