module Refinery
  module Press
    class PressController < ::ApplicationController

      before_filter :find_all_press
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @endorsement in the line below:
        present(@page)
      end

      def show
        @endorsement = Endorsement.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @endorsement in the line below:
        present(@page)
      end

    protected

      def find_all_press
        @press = Endorsement.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/press").first
      end

    end
  end
end
