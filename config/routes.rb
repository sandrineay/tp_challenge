Rails.application.routes.draw do
  root to: 'jobs#index'
  resources :jobs, only: :index do
    collection do
      post :import
    end
  end
end
