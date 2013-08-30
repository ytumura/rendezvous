Rendezvous::Application.routes.draw do
  devise_for :users
  resources :posts

  root 'root#index'

  #devise_for :users do
  #  get "/login" => "devise/sessions#new"
  #  get "/logout" => "devise/sessions#destroy"
  #  get "/register" => "devise/registrations#new"
  #end
end
