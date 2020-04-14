# frozen_string_literal: true

class Achievement < ApplicationRecord
  validates :description, presence: true
end
