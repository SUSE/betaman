Betaman::Application.routes.draw do

  get "dashboard/index"

  get '/users/select', to: 'users#select', as: 'user_select'

  get '/users/:id/betas', to: 'users#betas', as: 'user_betas'
  get '/users/:id/add_beta/:beta_id', to: 'users#add_beta', as: 'user_add_beta'
  get '/users/:id/remove_beta/:beta_id', to: 'users#remove_beta', as: 'user_remove_beta'

  get '/betas/:id/add_select_users', to: 'betas#add_select_users', as: 'beta_add_select_users'
  post '/betas/:id/add_multiple_users', to: 'betas#add_multiple_users', as: 'beta_add_multiple_users'
  get '/betas/:id/add_user/:user_id', to: 'betas#add_user', as: 'beta_add_user'
  get '/betas/:id/remove_user/:user_id', to: 'betas#remove_user', as: 'beta_remove_user'
  get '/betas/:id/users', to: 'betas#users', as: 'beta_users'

  get '/lists/:id/refresh', to: 'lists#refresh', as: 'list_refresh'
  get '/lists/:id/users', to: 'lists#users', as: 'list_users'

  resources :users
  resources :betas
  resources :lists

  root to: 'static_pages#home'
  match '/help', to: 'static_pages#help'
  get "static_pages/help"

  match '/dashboard', to:'dashboard#index'

  match '/auth/:provider/callback', :to => 'session#callback'
  match '/auth/failure', :to => 'session#failure'
  match '/auth/:provider/failure', :to => 'session#failure'
  match '/auth/failure', :to => 'session#failure'


  namespace :admin do
    resources :users
    resources :betas
    resources :companies
    resources :lists
    get '', to: 'dashboard#index', as: '/'
  end
  
  match ':controller/:action' => ":controller#:action"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
