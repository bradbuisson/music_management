SamuelRainesMusic::Application.routes.draw do
  resources :users, :only => [:edit, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :articles, :shows, :blogs
  resources :tags, :only => :show

  root :to => 'dashboard#home', :as => :home

  match '/signin'   => 'sessions#new'
  match '/signout'  => 'sessions#destroy', :via => :delete
  match '/blog'     => 'blogs#index', :as => :blogs
end
