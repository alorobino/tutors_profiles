class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true

  def self.search(search, params = {})
    if search
      results = User.where("location ILIKE ?", "%#{search}%")
      results = results.where(gender: params[:gender]) unless params[:gender].blank?
      # results = results.where(english: params[:english])
      # results = results.where(skype: params[:skype])
      results
    else
      User.all
    end
  end

end
