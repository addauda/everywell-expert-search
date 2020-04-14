Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmls
  resources :members
  resources :friends, only: %i[create]
  get '/search/:id', to: 'topics#search'
  root 'members#index'
end
