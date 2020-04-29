class MainActivity < ApplicationRecord
  belongs_to :user
  has_one :task, dependent: :destroy
end
