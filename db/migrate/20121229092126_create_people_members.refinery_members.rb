# This migration comes from refinery_members (originally 1)
class CreatePeopleMembers < ActiveRecord::Migration

  def up
    create_table :refinery_people_members do |t|
      t.string :name
      t.integer :year
      t.integer :photo_id
      t.string :voice
      t.string :major
      t.string :hometown
      t.text :bio
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-people"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/people/members"})
    end

    drop_table :refinery_people_members

  end

end
