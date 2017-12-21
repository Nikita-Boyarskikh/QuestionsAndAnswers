Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :likes
  resources :tags
  devise_for :users
  root 'questions#index'
end
