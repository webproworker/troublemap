Troublemap::Application.routes.draw do
  # get "troubles/city/:id" => "troubles#city", :as => :city_trouble

  get "auth/twitter/callback" => "sessions#create"
  get "auth/facebook/callback" => "sessions#create"
  post "auth/identity/callback" => "sessions#create"
  get "signout" => "sessions#destroy", :as => :signout
  # get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :troubles do
    resources :comments
  end

  resources :identities
  resources :cities
  resources :users

  # You can have the root of your site routed with "root"
  root 'troubles#frontpage'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # get 'troubles/:id/city' => 'troubles#city', as: :city

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
