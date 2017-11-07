Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :status, only: [:create]
    end
  end

  root 'health_check#index'
end
