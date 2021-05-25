class Instructor < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates :name, :email, presence: true

  def display_name
    "#{name} - #{email}"
  end
end
