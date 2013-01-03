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
        @availabilities = Slot.available_timeslots
        @audition = Audition.new
      end

      def create
        @audition = Audition.new(params[:audition])
        if @audition.save
          notice = "Thanks for signing up! You're all set, #{@audition.firstname}!"
        else
          alert = "Oops, there was a problem saving your info. Did you fill in all the required fields?"
        end
        redirect_to refinery.auditions_auditions_path, :notice => notice, :alert => alert
      end

    protected

      def find_all_auditions
        @auditions = Audition.all
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/auditions").first
      end

    end
  end
end
