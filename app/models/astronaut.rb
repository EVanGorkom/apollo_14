class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.avg_age
    Astronaut.average(:age)
  end

  def mission_list
    missions.order(:title)
  end

  def total_space_time
    missions.sum(:time_in_space)
  end
end
