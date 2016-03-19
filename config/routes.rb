Rails.application.routes.draw do
  resources :emails
  get '/posts' => 'posts#index'
  patch '/admin/update' => 'admin#update' 
  resources :posts

  
  resources :images
  resources :posts
  resources :bitotsavcores
  namespace :bitotsav do
    resources :volunteers
  end
  namespace :bitotsav do
    resources :organisers
  end
  get '/about' => 'about#index'	
  get 'about/index'
  get '/bitotsav' => 'bitotsav#index'
  get '/bitotsavcores' => 'bitotsavcores#index'
  root 'main#index'
  get '/main' => 'main#index'

  
  get '/feedback' => 'feedback#new' 
  resources :feedbacks



	get '/admin' => 'admin#index'
	get '/:id' => 'clubs#view' 
  
  namespace :admin do
    namespace :update do
      resources :clubs
    end
  end
  namespace :admin do
    namespace :update do
      resources :executive_bodies
    end
  end
  resources :clubs
  resources :executive_bodies
  resources :executive_bodies


  match ':controller(/:action(/:id))' , :via => [:get, :post, :update, :delete]  


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
