module Refinery
  module Auditions
    class Audition < Refinery::Core::BaseModel
      self.table_name = 'refinery_auditions'

      belongs_to :slot, :class_name => "Refinery::Auditions::Slot"

      attr_accessible :firstname, :lastname, :dorm, :voice, :room, :email, :phone, :year, :emailed, :position, :slot_id

      acts_as_indexed :fields => [:firstname, :lastname, :dorm, :voice, :room, :email, :phone, :year]

      # must have a valid associated slot, and that slot must be unique
      validates :slot, :presence => true#, :uniqueness => true
      validates :slot_id, :uniqueness => true

      validates :name, :presence => true

      #TODO: add more mandatory fields and some level of smartness (phone formatting, email checking, etc)

      def name
        # squish trims edge whitespace and compacts internal whitespace
        "#{firstname} #{lastname}".squish
      end

      # def insert_by_timeslot
      #   if Audition.count > 0
      #     all = Audition.all
      #     all.each do |a|
      #       if a.slot.timeslot > self.slot.timeslot
      #         self.position = a.position
      #         break
      #       end
      #     end
      #     all[self.position..-1].each do |a|
      #       a.position = a.position + 1
      #       a.save
      #     end
      #   else
      #     self.position = 1
      #   end
      # end

    end
  end
end
