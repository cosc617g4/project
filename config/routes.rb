Marathonrunnerphotos::Application.routes.draw do

  
  get "userphotos/userphoto"
  get "userphotos/my_album"
  get "userphotos/setdefaultphoto"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "administrator/index"

  get "administrator/marathon"

  get "newsfeed/main"

  get "newsfeed/add"

  get "newsfeed/remove"

  get "newsfeed/block"

  get "newsfeed/unblock"

  get "user_marathons/index"

  resources "search"

  get "marathons/index"

  get "marathons/create"

  get "marathons/add"
  
  resources :user_marathons

  get "profile/index"

  resources :phototags


  resources :comments


  # for friend function
  get "friendship/index"
  get "friendship/new"
  get "friendship/show"
  get "friendship/confirm"
  #resources :friendships do
  #  get :autocomplete_user_email, :on => :collection
  #end


  get "trainings/index"

  get "trainings/new"

  get "trainings/edit"

  get "trainings/update"

  get "trainings/show"

  get "training/index"

  get "training/show"

  get "training/edit"

  get "training/new"

  get "index/new"

  get "index/edit"

  get "index/show"


  resources :photos do
    collection do
      get :myphotos
      get :setdefaultphoto
    end
  end
  
  get "userphotos/userphoto"
  post "userphotos/userphoto"
  
  resources :trainings


  devise_for :users
  ActiveAdmin.routes(self)
    
  get "messages/reply"
  
  get "messages/outbox"
  
  get "messages/show"
  
  get "index/login"

  get "test_branch_controller_manish/manish"

  get "test_branch/brad"

  get "main/tester"
  
  resources :messages
  
  get 'admins/', to: 'admins#index'

  

  # get 'admins/marathon', to: 'admins#marathon'

   # get "marathons/add", to: "marathons#add"

   # get "marathons/add", to: "marathons#add"

   # get "marathons/", to: "marathons#index"
  # get 'admins/user'

  # get 'admins/photo'

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
