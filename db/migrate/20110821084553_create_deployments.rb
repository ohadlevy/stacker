class CreateDeployments < ActiveRecord::Migration
  def self.up
    create_table :deployments do |t|
      t.references :stack
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :deployments
  end
end
