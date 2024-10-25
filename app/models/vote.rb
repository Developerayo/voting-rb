class Vote < ApplicationRecord
    validates :candidate_address, presence: true
    validates :voter_address, presence: true, uniqueness: true
  end