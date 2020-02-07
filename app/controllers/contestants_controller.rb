class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
  end

  private
    def contestant_params
      params.permit(:name, :age, :hometown, :years_of_experience)
    end
end
