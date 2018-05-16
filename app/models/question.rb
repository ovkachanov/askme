class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  before_save :add_hashtag

  private

  def add_hashtag
    self.hashtags.clear
    tags = self.text.scan(/#[[:alpha:]]+/)
    tags << self.answer.scan(/#[[:alpha:]]+/) if self.answer.present?
    tags.uniq.map do |hashtag|
      hashtag = Hashtag.find_or_create_by(name: hashtag.to_s.downcase.delete('#[]"'))
      self.hashtags << hashtag unless hashtag.nil?
    end
  end
end
