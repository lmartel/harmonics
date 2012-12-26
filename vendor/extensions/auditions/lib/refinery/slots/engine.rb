module Refinery
  module Auditions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Auditions

      engine_name :refinery_auditions

      initializer "register refinerycms_slots plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "slots"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.auditions_admin_slots_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/auditions/slot'
          }
          plugin.menu_match = %r{refinery/auditions/slots(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Slots)
      end
    end
  end
end
