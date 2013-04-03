module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :date, :photo_id, :blurb, :position

      acts_as_indexed :fields => [:title, :blurb]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      def pretty_datetime
        return "#{Date::DAYNAMES[date.wday]} #{date.in_time_zone('Pacific Time (US & Canada)').to_s(:long_ordinal)}"
      end
    end
  end
end
