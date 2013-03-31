HackMe::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"

  get "log_in"  => "sessions#new",     :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => "users#new",        :as => "sign_up"

  resources :sessions
  resources :users
  resources :articles

  root :to => "static_pages#home"
end
