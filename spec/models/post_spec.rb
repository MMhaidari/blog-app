require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:example) do
    @first_user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Driver from Mexico.')
  end

  subject { Post.new(author: @first_user, title: 'Hello', text: 'This is my post') }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments counter should be nil by default' do
    expect(subject.comments_counter).to eq nil
  end

  it 'likes counter should be greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be zero by default' do
    expect(subject.likes_counter).to eq nil
  end
end