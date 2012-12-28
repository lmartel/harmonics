module Refinery
  module Auditions
    class SlotsController < ::ApplicationController

      before_filter :find_all_slots
      before_filter :find_page

      # def index
      #   # you can use meta fields from your model instead (e.g. browser_title)
      #   # by swapping @page for @slot in the line below:
      #   present(@page)
      # end

      # def show
      #   @slot = Slot.find(params[:id])

      #   # you can use meta fields from your model instead (e.g. browser_title)
      #   # by swapping @page for @slot in the line below:
      #   present(@page)
      # end

    protected

      def find_all_slots
        @slots = Slot.order('timeslot ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/slots").first
      end

    end
  end
end
