Rails.application.routes.draw do



  
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  resources :users, path: 'usuarios'
  
  authenticate :user do

    root 'dashboard#index'

    resources :passwords, path: 'trocar_senha', only: [:edit, :update]
    resources :project_categories, path: 'categorias_obra'

    resources :projects, path: 'obras' do 
      resources :project_finances, path: 'caixa'
      resources :project_funds, path: 'gastos'
      resources :vehicles, path: 'veículos'
      resources :archives, path: 'arquivos'
      resources :fuel_expenses, path: 'consumo'
      resources :quotations, path: 'cotacoes' do 
        resources :budgets, path: 'orcamentos'
      end
      resources :bill_categories, path: 'categorias_conta'
      resources :pays, path: 'contas_pagar'
      resources :receipts, path: 'contas_receber'
      resources :suppliers, path: 'fornecedores'
    end
    
    resources :offices, path: 'escritorios'
    resources :office_supports, path: 'ponto de apoio'
    resources :supplier_categories, path: 'categorias_fornecedor'
    resources :staffs, path: 'funcionarios'
    resources :vehicle_services, path: 'servicos_veiculo'
    resources :vehicle_categories, path: 'categoria_veiculo'
    resources :sectors, path: 'setores'
    resources :jobs, path: 'cargos'
    resources :beneficts, path: 'beneficios'

  end
end
