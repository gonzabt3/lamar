class Post < ApplicationRecord
  validates :body, presence: true

  after_create_commit { broadcast_prepend_to "posts"}
end
