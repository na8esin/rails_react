# frozen_string_literal: true

module Api
  # sample
  class SampleController < ApplicationController
    def index
      page = params[:page]

      page.match?(/\A\d\z/)

      render json: { page:, type: page.class }
    end
  end
end
