IsleOfIona::Application.routes.draw do






  get "users/index"

  get "users/show"

  get "simples/crop"

  get "pictures/crop"

  match 'sitemap.xml' => 'sitemaps#sitemap'

  match "/sitemap" => "sitemap#index"

  resources :maps
  match "/:name/cat/:parent/filter/:subcat/map" => "maps#show", :as => :mapper_show_subfiltered
  match "/:name/cat/:parent/filter/:subcat(/page/:page)(/per/:per)" => "posts#index", :as => :viewer_index_subfiltered_posts
  match "/:name/cat/:parent" => "posts#index", :as => :viewer_index_filtered_posts
  resources :posts do
    #get "/:name/cat/:parent/filter/:subcat/(page/:page/)(per/:per)", :action =>:index, :on =>:collection
  end 
  devise_for :admins



  namespace "admin" do 
    resources :albums
    resources :pages do 
      match "/crop" => "pages#crop", :as => :crop      
      resources :simples do
        match "/crop" => "simples#crop", :as => :crop      
      end
    end
    resources :galleries do 
      resources :pictures do
        match "/crop" => "pictures#crop", :as => :crop
      end
    end
    resources :categories
    resources :maps  
    resources :users
    resources :posts do 
      match "/crop" => "posts#crop", :as => :crop      
      resources :albums do
        resources :uploads do
          match "/crop" => "uploads#crop", :as => :crop
        end        
      end
    end
    match '/update_category' =>"posts#update_categories", :as => :update_categories
    
    root :to => "overview#index"
  end
  
  match "/galleries/sub/:parent" => "galleries#index", :as => :galleries_filtered
  match "/galleries" => "galleries#index", :as => :galleries
  
  match "/:name/filter/:subcat/map" => "maps#show", :as => :mapper_show
  match "/:name/filter/:subcat" => "viewer#show", :as => :viewer_filtered_posts
    

  #match "/:name/cat/:parent/filter/:subcat/(page/:page/)(per/:per)" => "posts#index", :as => :viewer_index_subfiltered_posts

 # match "/:name/cat/:parent/maps" => "maps#index", :as => :mapper_filtered_index
  match "/:name/cat/:parent/(page/:page/)(per/:per)" => "posts#index", :as => :viewer_index_filtered_posts

  match "/:parent/:name" => "viewer#show", :as => :viewer_sub
  
  match "/:name/maps" => "maps#index", :as => :mapper
  match "/:name" => "viewer#index", :as => :viewer
  root :to => "viewer#show", :name => "home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
