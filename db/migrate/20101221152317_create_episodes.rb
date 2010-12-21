class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.references :season
      t.integer :seq
      t.boolean :is_shown
      t.string :name
      t.string :name2
      t.text :des
      t.text :ref
      t.integer :create_by
      t.integer :update_by

      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
