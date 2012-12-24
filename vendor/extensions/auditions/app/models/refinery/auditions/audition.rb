module Refinery
  module Auditions
    class Audition < Refinery::Core::BaseModel
      self.table_name = 'refinery_auditions'

      attr_accessible :firstname, :lastname, :timeslot, :dorm, :voice, :room, :email, :phone, :year, :emailed, :position

      acts_as_indexed :fields => [:firstname, :lastname, :dorm, :voice, :room, :email, :phone, :year]

      validates :firstname, :presence => true, :uniqueness => true
    end
  end
end
