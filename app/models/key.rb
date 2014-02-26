class Key < ActiveRecord::Base
  belongs_to :resource
  has_many :stack_keys, :dependent => :destroy
  has_many :stacks, :through => :stack_keys
  validates_uniqueness_of :external_id, :scope => :resource_id
  validates_presence_of :key, :resource_id, :external_id

  alias_attribute :to_s, :key
  alias_attribute :name, :key
  alias_attribute :to_label, :key

  default_scope :order => 'LOWER(keys.key)'

  def find_by_deployment id
    external_key.lookup_values.where(:match => "deployment=#{id}")
  end

  private
  def external_key
    @ext_key ||= LookupKey.find(external_id)
  end

end
