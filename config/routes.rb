Rails.application.routes.draw do
  resources :questions, except: :destroy do
    resources :answers, except: [:destroy, :index]
  end

  resources :likes, only: [:create, :update]
  resources :tags, only: [:index, :create, :show]

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'questions#index'
end
