module Refinery
  module Press
    class Endorsement < Refinery::Core::BaseModel
      self.table_name = 'refinery_press'

      attr_accessible :quote, :source, :link, :position

      acts_as_indexed :fields => [:quote, :source, :link]

      validates :quote, :presence => true, :uniqueness => true
    end
  end
end
