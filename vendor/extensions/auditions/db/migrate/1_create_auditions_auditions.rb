class CreateAuditionsAuditions < ActiveRecord::Migration

  def up
    create_table :refinery_auditions do |t|
      t.string :firstname
      t.string :lastname
      t.datetime :timeslot
      t.string :dorm
      t.string :voice
      t.string :room
      t.string :email
      t.string :phone
      t.string :year
      t.boolean :emailed
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-auditions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/auditions/auditions"})
    end

    drop_table :refinery_auditions

  end

end
