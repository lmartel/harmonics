module Refinery
  module Auditions
    class AuditionsController < ::ApplicationController

      before_filter :find_all_auditions
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @audition in the line below:
        present(@page)
      end

      def show
        @audition = Audition.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @audition in the line below:
        present(@page)
      end

      def signup
        @audition = Audition.new
      end

      def create
        Audition.create(params[:audition])
        redirect_to refinery.auditions_auditions_path
      end

    protected

      def find_all_auditions
        @auditions = Audition.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/auditions").first
      end

    end
  end
end
