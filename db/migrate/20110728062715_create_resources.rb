class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.string :type
      t.integer :external_resource_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
