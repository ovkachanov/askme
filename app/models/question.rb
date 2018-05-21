class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags, dependent: :destroy

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  before_save :add_hashtag


  private

  def add_hashtag
    self.hashtags.clear
    tags = self.text.scan(/#[\p{L}0-9_]{1,35}/)
    tags << self.answer.scan(/#[\p{L}0-9_]{1,35}/) if self.answer.present?
    tags.uniq.map do |hashtag|
      hashtag = Hashtag.find_or_create_by(name: hashtag.to_s.downcase.delete('#[]"'))
      self.hashtags << hashtag unless hashtag.nil?
    end
  end
end
