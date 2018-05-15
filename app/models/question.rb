class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  after_create :create_hashtag
  before_update :update_hashtag

  private

  def create_hashtag
    question = Question.find_by(id: self.id)
    tags = self.text.scan(/#[[:alpha:]]+/)
    tags << self.answer.scan(/#[[:alpha:]]+/) if self.answer.present?
    tags.uniq.map do |hashtag|
      hashtag = Hashtag.find_or_create_by(name: hashtag.to_s.downcase.delete('#[]"'))
      question.hashtags << hashtag
    end
  end

  def update_hashtag
    question = Question.find_by(id: self.id)
    self.hashtags.clear
    tags = self.text.scan(/#[[:alpha:]]+/)
    tags << self.answer.scan(/#[[:alpha:]]+/) if self.answer.present?
    tags.uniq.map do |hashtag|
      hashtag = Hashtag.find_or_create_by(name: hashtag.to_s.downcase.delete('#[]"'))
      question.hashtags << hashtag
    end
  end
end
