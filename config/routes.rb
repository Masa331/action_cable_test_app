Rails.application.routes.draw do
  get 'chat/index'
  resources :sessions, only: [:create]
  delete 'sessions', to: 'sessions#destroy'

  get 'static_pages/home'

  root 'static_pages#home'

  mount ActionCable.server => '/cable'
end
