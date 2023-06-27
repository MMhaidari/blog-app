class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_create :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.size)
  end
end
