Rails.application.routes.draw do

  get 'bike_parts/:id', to: 'bike_parts#show', as: :show_bike_part

  resources :orders
  post 'payment_received/:id', to: 'orders#payment_received', as: :payment_received

	get '/auth/:provider/callback', to: 'sessions#create'
	get '/logout', to: 'sessions#logout'



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

  #resources :bike_parts do
  #  resources :services
  #end

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


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'front_page#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
