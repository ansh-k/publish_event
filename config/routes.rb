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
      resources :rates, only: [] do
        collection do
          post :like
          post :unlike
        end  
      end
        
      resources :comments
    end
  end

  resources :locations, only: %i[show index]
  resources :invitations, only: %i[show index] do
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
