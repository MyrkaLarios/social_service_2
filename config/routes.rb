# frozen_string_literal: true
require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', invitations: 'users/invitations' }

  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
      resources :multiple_questions
      resources :comprehension_questions
      resources :periods
      resources :editorial
      resources :level
      resources :unit
      resources :comprehension_questions
      resources :exams
      resources :students
      resources :certificates
      resources :certificate_templates
      resources :exam_quest
      resources :employees
      get '/send_exam' => 'send_exam#show'
      get '/editorial_levels' => 'editorial_levels#show'
      get '/level_units' => 'level_units#show'
      get '/unit_questions' => 'unit_questions#show'
      get '/exam_unit_questions' => 'exam_unit_questions#show'
      get '/settings' => 'dashboard#settings'
      get '/users' => 'devise#users'
      get '/print' => 'certificates#print'
      get '/discard_printed' => 'certificates#discard_printed'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end

  mount Sidekiq::Web => "/sidekiq"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
