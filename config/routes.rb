Learningbar::Application.routes.draw do
  devise_for :teachers,:controllers => { :registrations => :teacher_registrations }
  resources :teachers do
      collection do
         get 'edit_info'
      end
      get 'courses',:on => :member
  end

  devise_for :students,:controllers => { :registrations => :student_registrations,
    :omniauth_callbacks => "students/omniauth_callbacks",:sessions=>:sessions }  
  resources :students do
      resources :skills, :controller=> :students_skill_ships
      member do
         get 'edit_info'
         get 'edit_skills'
         #get 'courses'
      end  
      # resources :courses, :controller => "student_courses"
  end

  
  get "admins",:controller=>:admins,:action=>:show
  
  devise_for :admins
  namespace :admin do
    resources :students
  end
    

  resources :companies do
    member do
      get 'teachers'
      get 'courses'
    end
  end
    root :to => 'backbone#index'

  resources :course_catagories, :path=>''

  resources :courses do
    member do
      get  'attend_confirmation'
      post 'attend'
      get  're_attend_confirmation'
      post 're_attend'
      get  'cancel_attendance'
      post 'cancel_attendance_report'
      get  'attendee_info'
    end
  end
  get 'preparing'=>'courses#preparing'
  get 'about'=>'backbone#about'
  get 'FAQ'=>'backbone#FAQ'


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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'
end
