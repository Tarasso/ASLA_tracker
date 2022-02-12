# frozen_string_literal: true

Rails.application.routes.draw do
<<<<<<< HEAD
  resources :newsletters
  resources :business_professionals
=======
  #get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
>>>>>>> 2a25039298123bd6a949167e62ac403341794b69
  resources :student_members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
end
