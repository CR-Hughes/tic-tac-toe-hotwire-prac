Rails.application.routes.draw do
  root 'games#new'

  resources :games, only: [:new, :show, :create] do
    resources :moves, only: [:create]
    member { patch :reset }
  end
end
