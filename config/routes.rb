Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/show'
  resources :users
  
  root 'logins#index'
  get 'logins/index'
  get 'logins/new_password'
  
  get 'users/index'
  get 'users/new'
  post "users/create" => "users#create"
  get 'users/show'
  get "users/:id/edit" => "users#edit"
  put "users/:id" => "users#update"
  get "users/:id/delete" => "users#delete"
  get "users/:id/destroy" => "users#destroy"
  get "users/:id/profile" => "users#profile"
  
  get 'digitals/index'
  get 'digitals/new'
  post "digitals/create" => "digitals#create"
  get 'digitals/show'
  get "digitals/:id/edit" => "digitals#edit"
  put "digitals/:id" => "digitals#update"
  get "digitals/:id/delete" => "digitals#delete"
  get "digitals/:id/destroy" => "digitals#destroy"

  get 'indizacions/index'
  get 'indizacions/show'
  get "indizacions/:id/edit" => "indizacions#edit"
  put "indizacions/:id" => "indizacions#update"
  get "indizacions/:id/delete" => "indizacions#delete"
  get "indizacions/:id/destroy" => "indizacions#destroy"

  get 'reviews/index'
  get 'reviews/show'
  get "reviews/:id/edit" => "reviews#edit"
  put "reviews/:id" => "reviews#update"
  
  get "reports/:id/view" => "reports#view"
  get 'reports/indicator'

  get 'pages/index'
  get 'pages/about_us'
  get 'pages/faq'
  get 'pages/tos'
  get 'pages/contact_us'
  get 'logins/logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "logins" => "logins#login"

end
