class Course < ApplicationRecord
  before_create :generate_code

  belongs_to :instructor
  has_many :lessons
  has_many :enrollments

  validates :name, :price, :code, presence: true
  validates :code, uniqueness: true

  has_one_attached :banner

  scope :available, -> { where(enrollment_deadline: Date.current..) }
  scope :min_to_max, -> { order(price: :asc) }

  private

  def generate_code
    self.code = SecureRandom::base58(20)
    generate_code if Course.exists?(code: self.code)
  end
end
