Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :status, only: [:create]
    end
  end

  post 'authenticate', to: 'authentication#authenticate'
  root 'health_check#index'
end
