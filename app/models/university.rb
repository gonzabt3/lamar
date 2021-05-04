class University < ApplicationRecord
  validates :name, :presence => true

  has_many  :careers
end
