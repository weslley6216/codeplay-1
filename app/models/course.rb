class Course < ApplicationRecord
  validates :name, :price, :code, presence: { message: 'não pode ficar em branco' }
  validates :code, uniqueness: { message: 'já está em uso' }
end

