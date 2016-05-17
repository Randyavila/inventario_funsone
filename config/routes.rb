Rails.application.routes.draw do



  resources :solicituds
  resources :estados
  resources :grupos
  root 'home#index'
  devise_for :users #, :skip => [:registrations]
  resources :articulos
  resources :pedidos
  resources :departamentos
  resources :enviarpedidos

end
