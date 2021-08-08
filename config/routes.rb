Rails.application.routes.draw do
  devise_for :users
  resources :jogging_times
  get 'jogging_times/show'
  root 'home#index'
  get 'home/jogging_times'
  get '/users/show/:id' => 'users#show', as: :users_show
  get '/users/edit/:id' => 'users#edit', as: :users_edit
  patch '/users/update/:id' => 'users#update', as: :users_update
  delete '/users/destroy/:id' => 'users#destroy', as: :users_destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
