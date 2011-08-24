class CreateKeys < ActiveRecord::Migration
  def self.up
    create_table :keys do |t|
      t.string :key
      t.references :resource
      t.integer :external_id

      t.timestamps
    end
  end

  def self.down
    drop_table :keys
  end
end
