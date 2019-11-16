Rails.application.routes.draw do
  devise_for :users
  resources :searchs
  resources :team, :path => "equipe"
  resources :contact_report, :path => "contact"
  resources :admins, :path => "admin"
  resources :users, :path => "profil"
  resources :events do
    resources :attendances
  end
  root "events#index"
end
