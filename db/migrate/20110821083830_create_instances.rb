class CreateInstances < ActiveRecord::Migration
  def self.up
    create_table :instances do |t|
      t.references :resource
      t.references :deployment
      t.string :uuid
      t.timestamps
    end
  end

  def self.down
    drop_table :instances
  end
end
