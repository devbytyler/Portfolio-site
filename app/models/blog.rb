class Blog < ApplicationRecord
  enum status: {Draft: 0, Published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic

  has_many :comments, dependent: :destroy

end



#MVC -Model view controller