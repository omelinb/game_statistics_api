# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team, optional: true

  validates :name, presence: true
end
