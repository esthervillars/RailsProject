class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  

  #potentially add conditional to rating if comment model is used for other purposes, like users sending each other messages.
  

  #validate relationship, not database field of foreign
  
  

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

end
