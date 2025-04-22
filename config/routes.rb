Rails.application.routes.draw do
  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  

  namespace :api do
    namespace :v1 do
      resources :challanges
    end
  end
end
