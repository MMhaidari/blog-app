require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:example) do
    @user = User.new(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post = Post.new(author: @user, title: 'Hello', text: 'This is my first post')
  end

  subject { Comment.new(user: @user, post: @post) }

  it 'name should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'title should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
