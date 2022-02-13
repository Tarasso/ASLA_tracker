# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD
  resources :newsletters
  resources :business_professionals
  resources :student_members
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
=======
  root 'pages#home'
  # root to: 'dashboards#show'

  # pass thru and a callback
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # login page and logout button
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :student_members
  resources :newsletters
  resources :business_professionals
  resources :student_members

  get 'pages/about'
  get 'pages/contact'
>>>>>>> 03ce000f0eafd6a69da7816cd3c32c438df1e6b2
end
