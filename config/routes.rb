Rails.application.routes.draw do
  resources :password_resets
  resources :participants
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
      get :show_photos  
    end
    collection do
      get :activities
      get :proyects
      get :services
    end
  end
  resources :usuarios do
    member do
      get :show_investigator
    end
    collection do
      get :investigators
    end
  end
  resources :role
  resources :audits
  devise_for :users
  root to: 'home#index'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
