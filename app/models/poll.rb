# frozen_string_literal: true

class Poll < ApplicationRecord
  belongs_to :user

  has_many :choices, dependent: :destroy
end
