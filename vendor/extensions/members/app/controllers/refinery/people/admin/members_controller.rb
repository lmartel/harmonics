module Refinery
  module People
    module Admin
      class MembersController < ::Refinery::AdminController

        crudify :'refinery/people/member',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
