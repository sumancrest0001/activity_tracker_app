class MainActivity < ApplicationRecord
  belongs_to :user
  has_one :task, dependent: :destroy

  validates :title, presence: true
  validates :recorded, presence: true
end
