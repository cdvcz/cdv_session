CdvSession::Engine.routes.draw do
  resources :sessions, only: [:create, :destroy]
end
