class CreateStackResources < ActiveRecord::Migration
  def self.up
    create_table :stack_resources do |t|
      t.references :stack
      t.references :resource
      t.timestamps
    end
  end

  def self.down
    drop_table :stack_resources
  end
end
