class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favouriters, through: :favourites, source: :user

  has_many :stars, dependent: :destroy
  has_many :star_raters, dependent: :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  belongs_to :category
  belongs_to :user
  validates :title, presence: true, length: { minimum: 7 }
  # uniqueness:{case_sensitive:false,
  #                                                 message: "must be unique"}

  validates :body, presence: true

  # after_initialize :body_snippet
  # Test drive a method `body_snippet`  that returns a maximum of a
  # 100 characters with "..." of the body if it's more than a 100 characters long.

  def user_full_name
    if user
      user.first_name + ' ' + user.last_name
    else
      'Anonymous'
    end
  end

  def body_snippet
    body_length = body.length
    body.slice(0, 100) + '...' if body_length > 100
  end

  def favourite_for(user)
    favourites.find_by(user: user)
  end
end
