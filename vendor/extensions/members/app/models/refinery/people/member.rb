module Refinery
  module People
    class Member < Refinery::Core::BaseModel

      attr_accessible :name, :year, :photo_id, :voice, :major, :hometown, :bio, :position

      acts_as_indexed :fields => [:name, :voice, :major, :hometown, :bio]

      validates :name, :presence => true, :uniqueness => true
      validates_presence_of :year, :voice, :hometown

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
