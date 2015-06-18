Rails.application.routes.draw do



  
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  resources :users
  
  authenticate :user do
    root 'dashboard#index'

    resources :project_categories

    resources :projects, path: 'projetos' do 
      resources :project_funds
      resources :vehicles
      resources :archives
      resources :fuel_expenses
      resources :gas_stations
      resources :quotations do 
        resources :budgets do 
          resources :budget_products
        end
      end
      resources :bill_categories
      resources :bills
    end
    
    resources :suppliers
    resources :vehicle_services
    resources :vehicle_categories
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
