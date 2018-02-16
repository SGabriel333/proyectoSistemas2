Rails.application.routes.draw do
  resources :photos
  resources :documents
  resources :managers
  resources :states
  resources :students
  resources :careers
  resources :attacheds
  resources :universitarios
  resources :carreras
  resources :investigations do
  	member do
  		get :show_attacheds
      get :create_attached
  	end
    collection do
      get :my_investigations
    end
  end
  resources :extensions do
    member do
      get :show_documents
    end
    collection do
      get :activities
      get :proyects
      get :services
    end
  end
  resources :extensions do
    member do
      get :show_photos
    end
  end
  resources :usuarios
  resources :role
  resources :audits
  devise_for :users

  get "managers" => 'managers', :as => :m_managers

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
