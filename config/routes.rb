# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles do
    post :mark_as_approved, on: :member
    post :inactivate, on: :member
    get :published, on: :collection
  end

  resources :categories do
    get :articles, on: :member
    get :articles_list, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
