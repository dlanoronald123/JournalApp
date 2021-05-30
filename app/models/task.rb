class Task < ApplicationRecord
    belongs_to :category

    validates :name, presence: true
    validates :description, presence:true, length: {minimum: 5}
    validates :deadline, presence:true
end
