module Refinery
  module Press
    module Admin
      class PressController < ::Refinery::AdminController

        crudify :'refinery/press/endorsement',
                :title_attribute => 'quote', :xhr_paging => true

      end
    end
  end
end
