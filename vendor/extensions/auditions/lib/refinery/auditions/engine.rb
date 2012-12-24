module Refinery
  module Auditions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Auditions

      engine_name :refinery_auditions

      initializer "register refinerycms_auditions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "auditions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.auditions_admin_auditions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/auditions/audition',
            :title => 'firstname'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Auditions)
      end
    end
  end
end
