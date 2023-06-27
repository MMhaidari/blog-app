class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_posts_counter
    update(posts_counter: posts.size)
  end

  def decrement_posts_counter
    update(posts_counter: posts.size)
  end
end
