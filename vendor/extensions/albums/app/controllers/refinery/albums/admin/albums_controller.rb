module Refinery
  module Albums
    module Admin
      class AlbumsController < ::Refinery::AdminController

        crudify :'refinery/albums/album', :xhr_paging => true, :order => "date DESC",
                   :sortable => false

      end
    end
  end
end
