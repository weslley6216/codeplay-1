class Instructor < ApplicationRecord
  has_many :courses

  def display_name
    "#{name} - #{email}"
  end
end