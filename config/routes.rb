Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
