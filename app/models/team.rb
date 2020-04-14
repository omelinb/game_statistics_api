# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :games, through: :game_statistics

  validates :name, presence: true
end
