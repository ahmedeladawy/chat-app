Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   root 'users#index'
   #temporary root path for now

   resources :users, only:[:new, :create, :index] do
    resources :chats, only: [:index, :show, :create]
   end

   resources :messages, only:[:create]

   resources :sessions, only:[:new, :destroy, :create]

   # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
