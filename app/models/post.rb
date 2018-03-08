class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  after_create_commit {PostBroadcastJob.perform_later(self)}
end
