Refinery::Core::Engine.routes.append do

  # Frontend routes
  # namespace :people, :path => 'band' do
  namespace :people do
    resources :members, :only => [:index, :show]
  end

  # Admin routes
  namespace :people, :path => '' do
    namespace :admin, :path => 'refinery/people' do
      resources :members, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
