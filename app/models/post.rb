class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  default_scope { order(created_at: :desc)}

  after_create_commit {PostBroadcastJob.perform_later(self)}

  def self.recent
      order("created_at DESC")
  end
end
