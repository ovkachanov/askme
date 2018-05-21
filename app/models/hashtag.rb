class Hashtag < ApplicationRecord

  has_and_belongs_to_many :questions

  validates :name, presence: true
  validates :name, length: { maximum: 35 }

  before_validation :downcase_hashtag


  def downcase_hashtag
    self.name = name.downcase
  end
end
