module Refinery
  module Auditions
    module Admin
      class SlotsController < ::Refinery::AdminController

        crudify :'refinery/auditions/slot', :xhr_paging => true, :order => "timeslot ASC", :sortable => false

      end
    end
  end
end
