module Api
    module V1
      class VotesController < ApplicationController
        
        def index
          votes = Vote.all
          render json: votes
        end
  
        def create
          vote = Vote.new(vote_params)
          if vote.save
            render json: vote, status: :created
          else
            render json: { errors: vote.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        def show
          vote = Vote.find_by(voter_address: params[:id])
          if vote
            render json: vote
          else
            render json: { error: 'Vote not found' }, status: :not_found
          end
        end
  
        def candidate_votes
          votes = Vote.where(candidate_address: params[:address])
          render json: {
            candidate_address: params[:address],
            vote_count: votes.count,
            votes: votes
          }
        end
  
        private
  
        def vote_params
          params.require(:vote).permit(:candidate_address, :voter_address)
        end
      end
    end
  end