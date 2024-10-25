class VoteSerializer < ActiveModel::Serializer
    attributes :id, :candidate_address, :voter_address, :created_at
  end