# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :game_statistics
  has_many :games, -> { distinct }, through: :game_statistics

  validates :name, presence: true
end
