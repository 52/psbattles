Rails.application.routes.draw do
  root 'home#index'
  devise_scope :user do
    get    'signup', to: 'devise/registrations#new'
    post   'signup', to: 'devise/registrations#create'
    get    'login',  to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  devise_for :users

  resources :battles do
    resources :submissions, only: [:index, :create, :edit, :update, :destroy]
  end

  resources :likes, only: [:create, :destroy]
end
