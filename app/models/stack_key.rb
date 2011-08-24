class StackKey < ActiveRecord::Base
  belongs_to :stack
  belongs_to :key
  validates_uniqueness_of :key_id, :scope => :stack_id
  validates_uniqueness_of :stack_id, :scope => :key_id
end
