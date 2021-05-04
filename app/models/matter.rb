class Matter < ApplicationRecord
  validates :name, :presence => true
  validates :career, :presence => true

  belongs_to :career
end
