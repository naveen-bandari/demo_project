# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # TODO: This is a temp fix until we introduce device gem tokens (naveen)
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { message: exception.message }, status: :unprocessable_entity # 422
    # render json: { message: "Validation failed: Title can't be blank" }, status: 422
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { message: exception.message }, status: :not_found
  end
end
