
require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'Viewing user show page' do
    before(:each) do
      @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                           posts_counter: 0)
      @first_post = Post.create(author: @user1, title: 'post1', text: 'This is my first post', likes_counter: 0,
                                comments_counter: 0)
      @second_post = Post.create(author: @user1, title: 'post2', text: 'This is my second post', likes_counter: 0,
                                 comments_counter: 0)
      @third_post = Post.create(author: @user1, title: 'post3', text: 'This is my third post', likes_counter: 0,
                                comments_counter: 0)
      @fourth_post = Post.create(author: @user1, title: 'post4', text: 'This is my fourth post', likes_counter: 0,
                                 comments_counter: 0)
      visit user_path(@user1)
    end

    it 'should show user clicked' do
      expect(page).to have_content(@user1.name)
    end

    it 'should show user photo' do
      expect(page).to have_css("img[src*='#{@user1.photo}']")
    end

    it 'should show user bio' do
      expect(page).to have_content(@user1.bio)
    end

    it 'should show posts_counter of clicked user' do
      expect(page).to have_content(@user1.posts_counter)
    end

    it 'should have a link to see all posts' do
      expect(page).to have_link('See all posts', href: user_posts_path(@user1))
    end
  end
end