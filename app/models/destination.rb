class Destination < ApplicationRecord
    has_many :bloggers
    has_many :bloggers, through: :posts
    
end
