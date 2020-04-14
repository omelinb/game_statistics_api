# frozen_string_literal: true

class GameStatistic < ApplicationRecord
  belongs_to :game
  belongs_to :team
  belongs_to :player
  belongs_to :achievement, optional: true
end
