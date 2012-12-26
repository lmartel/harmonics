module Refinery
  module Auditions
    class Slot < Refinery::Core::BaseModel

      has_one :audition, :class_name => "Refinery::Auditions::Audition"

      attr_accessible :timeslot, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        if timeslot
          formatted_timeslot
        else
          "No timeslot :("
        end
      end

      # Returns the formatted timeslot. Currently formatted like: "Dec 20, 2012 at 11:59am"
      def formatted_timeslot
        timeslot.strftime("%b %-d, %Y at %I:%M%P")
      end

      def self.open
        # Uses an left outer join to get only the Slots that do not yet have auditions (open slots)
        not_filled_slots = Slot.joins("LEFT OUTER JOIN refinery_auditions ON refinery_auditions.slot_id = refinery_auditions_slots.id").where("refinery_auditions.id IS null")
      end

      def self.available_timeslots
        # hashes available datetimes to the id of the Slot that owns them,
        # then converts to nested array ie [[Wed 4pm, 1], [Thur 2pm, 2]]
        self.open.each_with_object({}) { |slot, hash| hash[slot.formatted_timeslot] = slot.id }.to_a 

        # if we just wanted an array of the timeslots we could do
        # self.open.pluck(:timeslot)
      end

    end
  end
end
