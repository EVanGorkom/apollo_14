class AstronautMissionsController < ApplicationController
  def create
    # require 'pry';binding.pry
    # if params[:id] == Mission.id.any?
      AstronautMission.create(astronaut_id: params[:astronaut_id], mission_id: params[:id])
      redirect_to "/astronauts/#{params[:astronaut_id]}"
    # else
      # redirect_to "/astronauts/#{params[:astronaut_id]}"
    # end
  end
end