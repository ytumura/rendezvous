Rendezvous::Application.routes.draw do
  devise_for :users
  resources :posts

  root 'root#index'

  #get 'posts/user/:usr_id' => 'posts#user', as: "post_user"
  get 'tags/' => 'tags#index', as: "tag_root"
  get 'tags/:tag_name' => 'tags#list', as: "tag_list"

  #devise_for :users do
  #  get "/login" => "devise/sessions#new"
  #  get "/logout" => "devise/sessions#destroy"
  #  get "/register" => "devise/registrations#new"
  #end
end
