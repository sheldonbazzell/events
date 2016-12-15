Rails.application.routes.draw do
  root 'users#index'
  get 'users' => 'users#index'
  get 'events' => 'events#index'
  get 'users/index'
  get 'users/edit'
  get 'secrets/home'
  get 'users/new'
  post 'users' => 'users#create'
  post 'attends' => 'attends#create'
  post 'sessions' => 'sessions#create'
  post 'events' => 'events#create'
  post 'comments' => 'comments#create'
  delete 'sessions' => 'sessions#destroy'
  delete 'attends/:id' => 'attends#destroy'
  delete 'events/:id' => 'events#destroy'
  delete 'users' => 'users#destroy'
  patch 'users/:id' => 'users#update'
  patch 'events/:id' => 'events#update'
  get 'users/:id/edit' => 'users#edit'
  get 'events/:id/edit' => 'events#edit'
  get 'events/:id' => 'events#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
