Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
    }
  end

  namespace :api do
    namespace :v1 do
      resources :challanges
    end
  end
end
