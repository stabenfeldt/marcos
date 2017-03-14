Rails.application.routes.draw do
  resources :orders
  post 'payment_received/:id', to: 'orders#payment_received', as: :payment_received

	get '/auth/:provider/callback', to: 'sessions#create'
	get '/logout', to: 'sessions#logout'



  resources :products
  resources :parts
  get 'customers/search' => 'customers#search'
  get 'customers/search/:q' => 'customers#search'

  resources :services do
  end

  resources :bikes do
    resources :services
  end

  resources :users
  resources :customers do
    resources :bikes do
      get '/parts' => 'bikes#parts'
      post '/:id' => 'bikes#add_part'
      delete '/:id' => 'bikes#remove_part'
    end
  end


  get '/fp' => 'front_page#index'
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
