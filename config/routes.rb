Rails.application.routes.draw do
  
  get 'sessions/login' => 'sessions#login', :as => :login
 post 'sessions/login_attempt' => 'sessions#login_attempt'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'
  
  
  resources :events

  resources :dogs

  resources :handlers
  
  resources :entries
  
  get 'signup' => 'handlers#signup', :as => :signup
  post 'do_signup' => 'handlers#do_signup', :as => :do_signup
  
  #post 'event/do_entry' => 'events#do_entry', :as => :do_entry
  #map.resources :events :do_entry => :post
  
  root 'main#index'
  
  get "login" => "sessions#login"
  get "logout" => "sessions#logout"
  get "home" => "sessions#home"
  get "profile" => "sessions#profile"
  get "setting" => "sessions#setting"
  
  
  
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
