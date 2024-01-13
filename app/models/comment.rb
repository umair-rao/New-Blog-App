class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
