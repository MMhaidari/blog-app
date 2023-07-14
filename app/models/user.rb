class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def user_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def three_recent_posts
    posts.includes(:comments, :likes).last(3)
  end

  def update_posts_counter
    update(posts_counter: posts.size)
  end

  def decrement_posts_counter
    decrement(:posts_counter)
  end
end
