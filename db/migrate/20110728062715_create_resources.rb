class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :stacked_resources do |t|
      t.string :name
      t.string :type
      t.integer :external_resource_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stacked_resources
  end
end
