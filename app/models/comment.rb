class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  
  
  validates :user_id, presence: true
  

  #validates :body, presence: true, length: { minimum: 5 }

  #potentially add conditional to rating if comment model is used for other purposes, like users sending each other messages.
  

  #validate relationship, not database field of foreign
  
  #validates :product, presence: true
  #validates :post, presence: true
  

  #scope :rating_desc, -> { order(rating: :desc) }
  #scope :rating_asc, -> { order(rating: :asc) }

end
