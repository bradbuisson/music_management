SamuelRainesMusic::Application.routes.draw do
  resources :users, :only => [:edit, :update]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :shows, :except => :show
  resources :blogs do
    get :feed, :on => :collection
  end
  resources :articles do
    get :feed, :on => :collection
  end
  resources :tags, :only => :show

  root :to => 'dashboard#home', :as => :home

  match '/signin'   => 'sessions#new'
  match '/signout'  => 'sessions#destroy', :via => :delete
  match '/blog'     => 'blogs#index', :as => :blogs
end
