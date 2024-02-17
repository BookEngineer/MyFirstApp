Rails.application.routes.draw do
  devise_for :users
  resources :reviews

  get 'search_books/search'
  root 'pages#home'
  resources :users do
    member do
      get :mypage
      get :review_detail
    end
  end
end
