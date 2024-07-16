# frozen_string_literal: true

module Api
  # sample
  class SampleController < ApplicationController
    def index
      page = converted_page

      page.match?(/\A\d\z/)

      render json: { page:, type: page.class }
    end

    private

    def converted_page
      params[:page].to_s
    end
  end
end
