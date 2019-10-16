class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length:{ maximum:100}
  validates :production_year, presence: true, numericality: { only_integer: true, greater_than: 1990, less_than: 3000 }
  validates :running_time, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :rating, presence: true, inclusion: { in: ['G', 'PG12', 'R15+', 'R18+'], allow_blank: true }
end
