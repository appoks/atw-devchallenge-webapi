Rails.application.routes.draw do

  #get 'repositories', to: 'repositories#index'
  #get 'languages', to: 'repositories#index'
  resources :repositories
  resources :languages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
