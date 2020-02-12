class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
  has_many :comments

  def self.search(search)
    if search
      user = User.find_by(username: search)
      if user
        self.where(user_id: user)
      else
        Post.all
      end
    else
      Post.all
    end
  end

  acts_as_taggable_on :topics
  acts_as_taggable_on :levels

$levels = ['B', 'C', 'A']
$topics = ['verbs', 'subjunctive']
end
