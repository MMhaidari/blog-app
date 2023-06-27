class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_create :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_counter: post.likes.size)
  end
end
