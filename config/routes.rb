SamuelRainesMusic::Application.routes.draw do
  resources :articles, :shows, :blogs
  resources :sessions,  only: [:new, :create, :destroy]
  resources :users,     only: [:edit, :update]
  resources :tags,      only: :show

  root to: 'dashboard#home', as: :home

  get     '/signin'   => 'sessions#new'
  delete  '/signout'  => 'sessions#destroy'
  get     '/blog'     => 'blogs#index',     as: :blog
  get     '/music'    => 'dashboard#music'
end
