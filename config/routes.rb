Rendezvous::Application.routes.draw do
  #devise_for :users
  resources :posts

  root 'root#index'

  #get 'posts/user/:usr_id' => 'posts#user', as: "post_user"
  get 'tags/' => 'tags#index', as: "tag_root"
  get 'tags/search' => 'tags#search', as: "tag_search"
  get 'tags/:tag_name' => 'tags#list', as: "tag_list"

  devise_for :users, controllers: {
      registrations: 'custom_devise/registrations'
  }
end
