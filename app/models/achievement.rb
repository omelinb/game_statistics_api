# frozen_string_literal: true

class Achievement < ApplicationRecord
  has_many :game_statistics

  validates :description, presence: true
end
