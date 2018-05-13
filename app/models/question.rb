class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :hashtags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  after_create :create_hashtag

  private

  def create_hashtag
    question = Question.find_by(id: self.id)
    tags = self.text.scan(/#[[:alpha:]]+/)
    tags.uniq.map do |hashtag|
      hashtag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
      question.hashtags << hashtag
    end
  end
end
