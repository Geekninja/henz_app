Rails.application.routes.draw do


  devise_for :users

  root 'dashboard#index'

  resources :project_categories

  resources :projects, path: 'projetos' do 
    resources :vehicles
  end

  resources :staffs
  resources :sectors
  resources :jobs
  resources :beneficts
  resources :office_supports
  resources :offices
  resources :staffs
  resources :users

  resources :suppliers
  resources :supplier_contacts

end
