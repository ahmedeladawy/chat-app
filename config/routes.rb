Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   root 'welcome#index'
   #temporary root path for now
  #  resources :welcome, only: [:index]

   resources :users do
    resources :chats, only: [:index, :show, :create]
   end

   resources :messages, only:[:create]

   resources :sessions, only:[:new, :create] do
     delete :destroy, on: :collection
   end

   # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
