class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @avg_age = Astronaut.avg_age
  end

  def show
    @astronaut = Astronaut.find(params[:id])
  end
end