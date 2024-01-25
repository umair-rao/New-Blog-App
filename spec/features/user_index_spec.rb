require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    @user1 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from US.',
                         posts_counter: 0)
    @user2 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher all of us.',
                         posts_counter: 0)
    @post = Post.create(author_id: @user1.id, title: 'Hello', text: 'This is my first post.', comments_counter: 0,
                        likes_counter: 0)
    visit root_path
    @users = User.all
  end

  it 'I can see the username of all other users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'I can see the profile picture for each user' do
    @users.each do |_user|
      expect(page).to have_css("img[src*='https://unsplash.com/photos/F_-0BxGuVvo']")
    end
  end

  it 'I can see the number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end
  end

  it 'When I click on a user, I am redirected to that user\'s show page' do
    user = @users.first
    click_link user.name
    expect(page).to have_current_path(user_path(user))
  end
end
