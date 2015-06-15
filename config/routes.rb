Rails.application.routes.draw do

  resources :suppliers
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  resources :users
  
  authenticate :user do
    root 'dashboard#index'

    resources :project_categories
    resources :projects, path: 'projetos' do 
      resources :vehicles
      resources :budget_products
      resources :budgets
      resources :quotations
      resources :bill_categories
      resources :bills
    end

    resources :staffs
    resources :sectors
    resources :jobs
    resources :beneficts
    resources :office_supports
    resources :offices
    resources :staffs
    resources :suppliers
    resources :supplier_contacts
  end
end
