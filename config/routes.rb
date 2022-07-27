Rails.application.routes.draw do
  #resources :interventions
  resources :leads
  resources :customers
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#home'
  resources :quotes
  get 'pages/back'
  get 'pages/customers_location'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/quote'
  get 'rails_admin/data/playbriefing', to: 'data#playbriefing'
  get 'residential', to: 'pages#residential'
  get 'commercial', to: 'pages#commercial'
  get 'quote', to: 'pages#quote'
  get 'interventions/index' => 'interventions#index'
  get 'interventions/new'
  post 'interventions/create' => 'interventions#create'
  get 'interventions/customer_buildings' => 'interventions#customer_buildings'
  get 'interventions/building_battery' => 'interventions#building_battery'
  get 'interventions/battery_column'=> 'interventions#battery_column'
  get 'interventions/column_elevator'=> 'interventions#column_elevator'
  get 'interventions/employee' => 'interventions#employee'
    
  
  
  # get 'admin', to: 'pages#admin'
  post '/contacts', to: 'home#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Route for Homepage

end