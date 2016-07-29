Rails.application.routes.draw do
  devise_for :users

  resources :chat_rooms, only: [:new, :create, :show, :index]

    # resources :sessions, only: [:new, :create] do
    #   delete :destroy, on: :collection
    # end

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
end
