Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, 
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  #get 'home/index'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'inicio', to: 'home#inicio', as: 'inicio'
  # get '/libros/:libro_id/resenas', to: 'resenas#index'
  # get 'resenas/:libro_id', to: 'resenas#new'

  # resources :resenas
  # resources :libros
  get '/profile', to: 'users#show'

  resources :libros do
    resources :resenas
  end
  resources :libros do
    resources :mensajes
  end
  resources :libros do
    resources :compras
  end
  resources :user do
    resources :compras
  end
end

