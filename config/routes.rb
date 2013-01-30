SamuelRainesMusic::Application.routes.draw do
  resources :users, :only => [:edit, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :shows, :articles, :blogs, :except => :show
  resources :tags, :only => :show

  root :to => 'dashboard#home', :as => :home

  match '/signin'   => 'sessions#new'
  match '/signout'  => 'sessions#destroy', :via => :delete
end
