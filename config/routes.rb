Rails.application.routes.draw do

  root 'dashboard#index'

  resources :projects do 
    resources :vehicles
  end

  resources :staffs
  resources :users
  resources :sectors
  resources :jobs
  resources :suppliers
  resources :supplier_contacts

end
