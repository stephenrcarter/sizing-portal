class Environment < ActiveRecord::Base
  has_many :workloads
  validates :title, presence: true, length: { minimum: 4 }
end
