Rails.application.routes.draw do
  root to: 'books#index'
  get 'mypage' => 'mypage#show'
  get 'users/edit' => redirect('books')
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users' => 'users/registrations#index'
    get 'users/:id' => 'users/registrations#show'
    get 'mypage/edit' => 'users/registrations#edit'
  end
  resources :books
end
