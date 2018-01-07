Rails.application.routes.draw do
  resources :answers, except: :destroy
  resources :questions, except: :destroy
  resources :likes, only: [:create, :update]
  resources :tags, only: [:index, :create, :show]
  devise_for :users
  root 'questions#index'
end
