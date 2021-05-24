class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  after_create_commit { broadcast_prepend_to "posts"}
end
