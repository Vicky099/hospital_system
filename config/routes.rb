Rails.application.routes.draw do
  devise_for :doctors, :controllers => {:omniauth_callbacks => "doctors/omniauth_callbacks", :registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :doctor do
    root to: "devise/sessions#new"
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end

  resources :dashboards
  resources :doctors

  resources :hospitals do
    resources :medical_stores
  end

  resources :patients do
    member do
      get :prescribe_medicine
      get :generate_bill
      post :create_prescription
    end
    collection do
      get :prescriptions
    end
  end
end
