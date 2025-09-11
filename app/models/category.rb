class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :color, length: {minimum: 7}, format: {with: /\A^#/, message: "Please put a # before the color hex code" }
  has_many :tasks, dependent: :destroy
end
