Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'contents/index'
      post 'contents/create'
      get '/contents/:id', to: 'contents#show'
      delete '/destroy/:id', to: 'contents#destroy'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'users/index'
      post 'users/create'
      get '/users/:id', to: 'users#show'
      delete '/destroy/:id', to: 'users#destroy'
    end
  end
  root 'homepage#index'
  get '/*path' => 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
