module ImpactTravel
  class HomesController < ApplicationController
    before_action :require_login

    def show
      @search = Search.new
    end
  end
end
