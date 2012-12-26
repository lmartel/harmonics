class CreateAuditionsSlots < ActiveRecord::Migration

  def up
    create_table :refinery_auditions_slots do |t|
      t.datetime :timeslot
      t.integer :refinery_audition_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-auditions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/auditions/slots"})
    end

    drop_table :refinery_auditions_slots

  end

end
