# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team, optional: true
  has_many :games, through: :game_statistics
  has_many :achievements, through: :game_statistics

  validates :name, presence: true
end
