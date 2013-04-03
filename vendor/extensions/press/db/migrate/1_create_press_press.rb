class CreatePressPress < ActiveRecord::Migration

  def up
    create_table :refinery_press do |t|
      t.string :quote
      t.string :source
      t.string :link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-press"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/press/press"})
    end

    drop_table :refinery_press

  end

end
