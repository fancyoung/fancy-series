class CreateSeasons < ActiveRecord::Migration
  def self.up
    create_table :seasons do |t|
      t.references :series
      t.integer :seq
      t.integer :episodes_count
      t.boolean :is_closed
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
    drop_table :seasons
  end
end
