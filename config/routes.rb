# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles do
    post :submit_for_review, on: :collection
  end

  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
