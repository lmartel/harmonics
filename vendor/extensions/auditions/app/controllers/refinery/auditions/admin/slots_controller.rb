module Refinery
  module Auditions
    module Admin
      class SlotsController < ::Refinery::AdminController

        crudify :'refinery/auditions/slot', :xhr_paging => true, :order => "timeslot ASC", :sortable => false

        def populate
        	p = params["populate_form"]
        	start_params = []
        	end_params = []
        	(1..5).each do |i|
        		#print "start_time sub-param: " + p["start_time(" + i + "}i)"] + "\n"
        		start_params << p["start_time(#{i}i)"].to_i
        		end_params << p["end_time(#{i}i)"].to_i
        	end
        	start_time = DateTime.new(*start_params)
       	  end_time = DateTime.new(*end_params)
       	  print "OVER HERE\n"
       	  print start_time
       	  print end_time
       	  until start_time >= end_time
        		Slot.create(timeslot: start_time)
        		start_time = start_time.advance(minutes: p["duration"].to_i)
        		print start_time
        	end
        	redirect_to refinery.auditions_admin_slots_path
        end

        def obliterate
        	Slot.destroy_all if params["obliterate_form"]["passphrase"] == "DELETE ALL AUDITIONS"
        	redirect_to refinery.auditions_admin_slots_path
        end

      end
    end
  end
end
