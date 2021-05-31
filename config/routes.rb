Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
    end
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :stores, path: '', path_names: {
    sign_in: 'store/login',
    sign_out: 'store/logout',
    registration: 'store/signup',
  }, controllers: {
    sessions: 'stores/sessions',
    registrations: 'stores/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
