Rails.application.routes.draw do
  devise_for :users
  resources :books, :users
  root 'homes#top'
  get 'home/top' => 'homes#top', as: 'top'
  get 'home/about' => 'homes#about', as: 'about'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
