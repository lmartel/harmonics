Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :auditions do
    match '' => 'auditions#signup', :via => :get, :as => :audition
    resources :auditions, :path => '', :except => [:index, :show]
    #refinery/crudify defaults #show to auditions.:id rather than auditions/:id
    match '/:id' => 'auditions#show', :via => :get, :as => :audition
  end

  # Admin routes
  namespace :auditions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :auditions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :auditions do
    # Frontend users may not access slots
    # resources :slots, :only => [:index, :show]
  end

  # Admin routes
  namespace :auditions, :path => '' do
    namespace :admin, :path => 'refinery/auditions' do
      resources :slots, :except => :show do
        collection do
          post :update_positions
          post :populate
          delete :obliterate
        end
      end
    end
  end

end
