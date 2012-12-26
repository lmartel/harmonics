module Refinery
  module Auditions
    class Audition < Refinery::Core::BaseModel
      self.table_name = 'refinery_auditions'

      belongs_to :slot, :class_name => "Refinery::Auditions::Slot"

      attr_accessible :firstname, :lastname, :timeslot, :dorm, :voice, :room, :email, :phone, :year, :emailed, :position, :slot_id

      acts_as_indexed :fields => [:firstname, :lastname, :dorm, :voice, :room, :email, :phone, :year]

      validates :firstname, :presence => true, :uniqueness => true

    end
  end
end
