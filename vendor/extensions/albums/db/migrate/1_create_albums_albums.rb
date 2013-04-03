class CreateAlbumsAlbums < ActiveRecord::Migration

  def up
    create_table :refinery_albums do |t|
      t.string :title
      t.date :date
      t.integer :photo_id
      t.text :summary
      t.text :description
      t.string :purchase_link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-albums"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/albums/albums"})
    end

    drop_table :refinery_albums

  end

end
