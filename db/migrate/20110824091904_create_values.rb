class CreateValues < ActiveRecord::Migration
  def self.up
    create_table :values do |t|
      t.string :value
      t.references :key
      t.references :deployment
      t.integer :external_id

      t.timestamps
    end
  end

  def self.down
    drop_table :values
  end
end
