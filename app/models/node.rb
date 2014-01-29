class Node < ActiveRecord::Base
  belongs_to :node_type
  belongs_to :cluster
end
