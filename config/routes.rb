# frozen_string_literal: true

Rails.application.routes.draw do
  resources :business_attendances
  resources :member_attendances
  # resources :carousels
  # resources :officer_pics
  resources :event_business_professionals
  resources :event_student_members do
    member do
      get :register
      get :unregister
    end
  end
  resources :event_business_professionals do
    member do
      get :register
      get :unregister
    end
  end
  root 'pages#home'
  # root to: 'dashboards#show'

  # pass thru and a callback
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # login page and logout button
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :student_members do
    get 'search', on: :collection
    get :events
    get :attended_events
  end
  resources :newsletters
  resources :business_professionals do
    get 'search', on: :collection
  end
  resources :business_professionals do
    member do
      get :events
    end
  end
  resources :student_members do
    member do
      get :dashboard
      get :events
      get :eventcode
    end
  end
  resources :events
  resources :calendars
  resources :officer_pics
  resources :carousels

  get 'pages/about'
  get 'pages/contact'
  get 'pages/home'
  get 'pages/mail'
  get 'pages/officers'
  get 'pages/unauthorized'
  get 'pages/user_dashboard'
  get 'pages/select_account_type'
end
