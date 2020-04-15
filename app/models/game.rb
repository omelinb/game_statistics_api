# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :game_statistics, dependent: :destroy
  has_many :players, -> { distinct }, through: :game_statistics
  has_many :teams, -> { distinct }, through: :game_statistics
end
