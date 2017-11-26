Rails.application.routes.draw do

  get 'bike_parts/:id', to: 'bike_parts#show', as: :show_bike_part

  resources :orders
  post 'payment_received/:id', to: 'orders#payment_received', as: :payment_received

	get '/auth/:provider/callback', to: 'sessions#create'

	post '/toggle_admin', to: 'users#toggle_admin'

  devise_for :users, controllers: {
          sessions: 'sessions'
  }


  resources :products
  resources :parts
  get 'users/search' => 'users#search'
  get 'users/search/:q' => 'users#search'

  get '/parts/search:q' => 'parts#search'


  get 'delivered_to_service/:id' => 'services#delivered_to_service', as: :delivered_to_service
  get 'receipt_for_new_service/:id' => 'services#receipt_for_new_service',
    as: :receipt_for_new_service

  resources :bikes do
    resources :services
  end

  get '/services/new_with_parts_selected/:bike_id' \
        => 'services#new_with_parts_selected', as: :get_new_service_with_parts_selected
  post '/services/new_with_parts_selected/:bike_id' \
        => 'services#new_with_parts_selected', as: :new_service_with_parts_selected

  resources :services do
  end

  resources :users do
    get 'fetch_bikes_from_strava' => 'users#fetch_bikes_from_strava'
    resources :bikes do
      get '/parts'  => 'bikes#parts'
      post '/:id'   => 'bikes#add_part'
      delete '/:id' => 'bikes#remove_part'
    end
  end


  get '/order' => 'front_page#order'
  get '/service_booklet' => 'front_page#service_booklet'
  post '/contact_form' => 'front_page#contact_form'

  root 'front_page#index'

end
