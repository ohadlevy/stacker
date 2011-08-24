class StackKey < ActiveRecord::Base
  belongs_to :stack
  belongs_to :key
end
