class Lesson < ApplicationRecord
  belongs_to :course

  validates :name, :duration, :content, presence: true
end
