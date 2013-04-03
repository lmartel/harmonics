module Refinery
  module Press
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Press

      engine_name :refinery_press

      initializer "register refinerycms_press plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "press"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.press_admin_press_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/press/endorsement',
            :title => 'quote'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Press)
      end
    end
  end
end
