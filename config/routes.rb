Rails.application.routes.draw do
  root 'home#index'
  resources :courses do
    resources :lessons, only: %i[new create]
  end
end
