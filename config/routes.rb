Rails.application.routes.draw do
  devise_for :users

  get 'users/mypage'
  resources :reviews

  get 'search_books/search'
  root 'pages#home'
end
