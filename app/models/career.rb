class Career < ApplicationRecord
  validates :name, :presence => true
  validates :university, :presence => true

  belongs_to :university
end
