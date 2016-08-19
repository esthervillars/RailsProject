class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :body, presence: true

  #potentially add conditional to rating if comment model is used for other purposes, like users sending each other messages.
  validates :rating, numericality: { only_integer: true }

  #validate relationship, not database field of foreign
  validates :user, presence: true
  validates :product, presence: true
  

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

end
