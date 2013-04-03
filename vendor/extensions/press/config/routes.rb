Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :press do
    resources :press, :path => '', :only => [:index, :show] # :only => [:index, :show]
  end

  # Admin routes
  namespace :press, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :press, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
