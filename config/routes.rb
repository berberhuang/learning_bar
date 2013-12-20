Learningbar::Application.routes.draw do

  devise_for :students

  get "admins",:controller=>:admins,:action=>:show

  devise_for :admins

  # get "student/edit"
  # put "student/update"
  resource :student, :controller => :student do
    collection do
      get 'course'
    end
  end
  get "student(/:id)", :controller=>:student,:action=>:show
  # get "student/course"

  

  namespace :admin do
    resources :students
  end

  # get "course/index", :controller=>:course, :action=>:index
  resources :courses, :controller=>:courses do
    collection do
    end
  end
  get "courses/edit/:id",:controller=>:courses,:action=>:edit
  get "courses/attend_confirmation/:id", :controller=>:courses,:action=>:attend_confirmation
  get "courses/attend/:id", :controller=>:courses,:action=>:attend
  get "courses/cancel_attendence/:id", :controller=>:courses,:action=>:cancel_attendence
  #get "course/info/:id", :controller=>:backbone,:action=>:course_info


 # devise_for :users, :controllers =>{:registrations => "registrations",:sessions=>'sessions'}

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
  root :to => 'backbone#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'
end
