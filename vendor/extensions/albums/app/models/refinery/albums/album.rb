module Refinery
  module Albums
    class Album < Refinery::Core::BaseModel
      self.table_name = 'refinery_albums'

      attr_accessible :title, :date, :photo_id, :summary, :description, :purchase_link, :position

      acts_as_indexed :fields => [:title, :summary, :description, :purchase_link]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
