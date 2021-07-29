Rails.application.routes.draw do
  get 'mypage' => 'mypage#show'
  root to: 'books#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'users' => 'users/registrations#index'
    get 'users/:id' => 'users/registrations#show'
  end
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
