class Comment < ApplicationRecord
  belongs_to :user
  before_create :set_comment_number

  has_rich_text :body

  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy

  private

  def set_comment_number
    self.comment_number = user.comment_created
  end
end
