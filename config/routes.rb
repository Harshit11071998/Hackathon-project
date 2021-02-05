Rails.application.routes.draw do
  root "challenges#index"
  # post "challenge/create"
  devise_for :users
  resources :challenges do
    resource :collaborator, only: [:create, :destroy]
    resource :vote, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
