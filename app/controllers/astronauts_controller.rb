class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @avg_age = Astronaut.avg_age
  end
end