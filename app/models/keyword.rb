class Keyword < ApplicationRecord
  has_many :keyword
  has_many :posts, through: :keywords_posts
end
