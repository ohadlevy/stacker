class CreateStackKeys < ActiveRecord::Migration
  def self.up
    create_table :stack_keys do |t|
      t.references :stack
      t.references :key

      t.timestamps
    end
  end

  def self.down
    drop_table :stack_keys
  end
end
