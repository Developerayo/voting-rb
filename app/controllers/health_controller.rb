class HealthController < ApplicationController
    def index
      render json: {
        status: 'ok',
        environment: Rails.env,
        database: database_status,
        version: '0.1.0',
        timestamp: Time.current
      }
    end
  
    private
  
    def database_status
      ActiveRecord::Base.connection.execute('SELECT 1')
      'ok'
    rescue StandardError
      'error'
    end
  end