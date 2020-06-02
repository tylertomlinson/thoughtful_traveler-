Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :user do
    get '/edit', to: 'profile#edit'
    patch '/', to: 'profile#update'
    get '/', to: 'dashboard#index'

    resources :trips, only: [:index, :new, :create, :show, :edit]
    resources :trip_events, only: [:update]

    namespace :trips do
      namespace :upcoming do
        resources :trips, only: [:index]
      end
      namespace :past do
        resources :trips, only: [:index]
      end
    end
    # resources :upcoming_trips
    # resources :past_trips
  end

  namespace :visitor do
    resources :trips, only: [:index, :create]
  end

  post '/email', to: "email#create"
  get '/login', to: 'login#index'
  delete "/logout", to: "sessions#destroy"
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
