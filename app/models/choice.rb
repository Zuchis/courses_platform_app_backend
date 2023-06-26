# frozen_string_literal: true

class Choice < ApplicationRecord
  belongs_to :poll, foreign_key: 'poll_id'
end
