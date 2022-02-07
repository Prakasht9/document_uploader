Rails.application.routes.draw do
  devise_for :users

  root to: "documents#index"

  resources :documents, only: [:index, :show]

  resources :users, only: [:show, :edit, :update] do
    resources :documents, except: [:show], controller: 'users/documents'
  end
end
