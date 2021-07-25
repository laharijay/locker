Rails.application.routes.draw do
  resources :infos
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'
  root to: "home#index"

end
