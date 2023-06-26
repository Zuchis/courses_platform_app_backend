class Vote < ApplicationRecord
  belongs_to :choice
  belongs_to :poll
  belongs_to :user

  validates :user_id, uniqueness: { scope: :poll }
  
  
end
