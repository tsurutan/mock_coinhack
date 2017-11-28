Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :crypto_currencies
  resources :exchanges

  mount API::Root => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
