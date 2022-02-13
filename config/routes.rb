# frozen_string_literal: true

Rails.application.routes.draw do
  resources :calendars
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
  resources :events

  get 'pages/about'
  get 'pages/contact'
  get 'pages/officers'
end
