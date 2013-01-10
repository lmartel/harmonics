module Refinery
  module People
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::People

      engine_name :refinery_members

      initializer "register refinerycms_members plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "members"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.people_admin_members_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/people/member',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/people/members(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Members)
      end
    end
  end
end
