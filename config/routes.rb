Rails.application.routes.draw do
  root to: 'yarukotos#index'

  resources :yarukotos
end