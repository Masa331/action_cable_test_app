Rails.application.routes.draw do
  resources :sessions, only: [:create]
  delete 'sessions', to: 'sessions#destroy'

  get 'static_pages/home'

  root 'static_pages#home'
end
