Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :likes
  resources :tags
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
