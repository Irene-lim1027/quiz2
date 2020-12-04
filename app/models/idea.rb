class Idea < ApplicationRecord
    
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :likes
    has_many :likers, through: :likes, source: :user
    validates(:title, presence:true, uniqueness:true)
    validates(:description, presence:true)

end
