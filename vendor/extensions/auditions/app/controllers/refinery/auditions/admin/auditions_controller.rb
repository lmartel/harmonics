module Refinery
  module Auditions
    module Admin
      class AuditionsController < ::Refinery::AdminController

        crudify :'refinery/auditions/audition',
                :title_attribute => 'name', :xhr_paging => true, :sortable => false

        def index
        	@auditions = Audition.all.sort { |a1, a2| a1.slot.timeslot <=> a2.slot.timeslot }
        end

      end
    end
  end
end
