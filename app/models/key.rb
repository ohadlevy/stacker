require 'foreman/api'

class Key < ActiveRecord::Base
  belongs_to :resource
  has_many :stack_keys, :dependent => :destroy
  has_many :stacks, :through => :stack_keys
  validates_uniqueness_of :external_id, :scope => :resource_id
  validates_presence_of :key, :resource_id, :external_id

  def to_s
    key
  end

  default_scope :order => 'LOWER(keys.key)'

  def find_by_deployment id
    external_key.find_value_by_deployment(id) || Foreman::API::LookupValue.new(:name => key, "lookup_key_id" => external_id)
  end

  private
  def external_key
    @ext_key ||= Foreman::API::LookupKey.find(external_id)
  end

end
