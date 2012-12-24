module Refinery
  module Auditions
    module Admin
      class AuditionsController < ::Refinery::AdminController

        crudify :'refinery/auditions/audition',
                :title_attribute => 'firstname', :xhr_paging => true

      end
    end
  end
end
