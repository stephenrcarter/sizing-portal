class Environment < ActiveRecord::Base
  has_many :workloads
  has_one :environment_requirement
  has_many :clusters
  validates :title, presence: true, length: { minimum: 4 }
end
