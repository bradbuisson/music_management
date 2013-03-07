SamuelRainesMusic::Application.routes.draw do
  resources :sessions,  only: [:new, :create, :destroy]
  resources :articles, :shows, :blogs, :tags, only: [:index, :show]

  namespace :admin do
    resources :users, only: [:edit, :update]
    resources :articles, :shows, :blogs
    root to: 'dashboard#index'
  end

  root to: 'pages#home', as: :home

  get     '/signin'     => 'sessions#new'
  delete  '/signout'    => 'sessions#destroy'
  get     '/blog'       => 'blogs#index',     as: :main_blog
  get     '/music'      => 'pages#music'
  get     '/entry/:id'  => 'blogs#show',      as: :entry
end
