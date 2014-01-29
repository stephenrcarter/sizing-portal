class Cluster < ActiveRecord::Base
  has_many :nodes
  belongs_to :environment
end
