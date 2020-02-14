class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
  has_many :comments
  has_many :keywords_posts
  has_many :keywords, through: :keywords_posts

  # def self.search(search)
  #   if search
  #     user = User.find_by(username: search)
  #     if user
  #       self.where(user_id: user)
  #     else
  #       Post.all
  #     end
  #   else
  #     Post.all
  #   end
  # end

  acts_as_taggable_on :levels

$levels = ['Any','A','B','C']
end
