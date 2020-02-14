class KeywordsPost < ApplicationRecord
  belongs_to :keyword
  belongs_to :post
end
