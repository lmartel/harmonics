module Refinery
  module Albums
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Albums

      engine_name :refinery_albums

      initializer "register refinerycms_albums plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "albums"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.albums_admin_albums_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/albums/album'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Albums)
      end
    end
  end
end
