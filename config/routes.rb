Rails.application.routes.draw do
  devise_for :users

  root to: "documents#index"

  resources :documents, only: [:index, :show]
 
  get 'home/about_us'
  get 'home/faq'

  resources :posts, only: [:index, :show]

  resources :users, only: [:show, :edit, :update] do
    resources :posts, except: [:show], controller: 'users/posts'
    resources :documents, except: [:show], controller: 'users/documents'
  end
end
