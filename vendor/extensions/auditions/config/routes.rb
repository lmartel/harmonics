Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :auditions do
    match '' => 'auditions#signup', :via => :get, :as => :audition
    resources :auditions, :path => '', :except => [:index]
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
    resources :slots, :only => [:index, :show]
  end

  # Admin routes
  namespace :auditions, :path => '' do
    namespace :admin, :path => 'refinery/auditions' do
      resources :slots, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
