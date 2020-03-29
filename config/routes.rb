# frozen_string_literal: true

Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root 'welcome#index'

  resources :users, shallow: true do
    resources :locations do
      resources :comments
    end
    resources :events do
      resources :comments
    end
  end

  resources :locations , only: [:show, :index]
  resources :invitations, only: [:show, :index] do
    collection do
      get :sent_invitations
      get :receive_invitations
      get 'confirm/:token' => 'invitations#confirm', as: :confirm
    end
  end

  resources :events, only: [:show] do
    resources :invitations, except: %i[destroy edit update]
  end
end
