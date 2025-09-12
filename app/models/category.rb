class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :color, length: { is: 7 }, format: { with: /\A#(?:\h{3}|\h{6})\z/, message: "Please put a # before the color hex code" }
  has_many :tasks, dependent: :destroy
end
