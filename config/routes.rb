Rails.application.routes.draw do



  
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  resources :users
  
  authenticate :user do
    root 'dashboard#index'

    resources :project_categories

    resources :projects, path: 'projetos' do 
      resources :project_finances
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
      resources :pays
      resources :receipts
      resources :offices
      resources :suppliers
    end
    
    resources :supplier_categories
    resources :staffs
    resources :vehicle_services
    resources :vehicle_categories
    resources :sectors
    resources :jobs
    resources :beneficts
    resources :office_supports
    resources :offices
  end
end
