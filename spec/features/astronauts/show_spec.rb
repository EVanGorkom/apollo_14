require 'rails_helper'

RSpec.describe "Astronaut Show Page" do
  before :each do
    @astro1 = Astronaut.create!(name: "Buzz Aldren", age: 35, job: "Pilot")
    @astro2 = Astronaut.create!(name: "Neil Armstrong", age: 36, job: "Captain")
    @astro3 = Astronaut.create!(name: "Michael Collins", age: 37, job: "Mechanic")

    @mission1 = Mission.create!(title: "Apollo 11", time_in_space: 111)
    @mission2 = Mission.create!(title: "Apollo 12", time_in_space: 112)
    @mission3 = Mission.create!(title: "Apollo 13", time_in_space: 113)
    @mission4 = Mission.create!(title: "Gemini 11", time_in_space: 114)

    @astronaut_mission1 = AstronautMission.create!(astronaut_id: @astro1.id, mission_id: @mission1.id)
    @astronaut_mission2 = AstronautMission.create!(astronaut_id: @astro1.id, mission_id: @mission2.id)
    @astronaut_mission3 = AstronautMission.create!(astronaut_id: @astro1.id, mission_id: @mission3.id)

    @astronaut_mission4 = AstronautMission.create!(astronaut_id: @astro2.id, mission_id: @mission1.id)
    @astronaut_mission5 = AstronautMission.create!(astronaut_id: @astro2.id, mission_id: @mission2.id)
    @astronaut_mission6 = AstronautMission.create!(astronaut_id: @astro2.id, mission_id: @mission3.id)

    @astronaut_mission7 = AstronautMission.create!(astronaut_id: @astro3.id, mission_id: @mission1.id)
    @astronaut_mission8 = AstronautMission.create!(astronaut_id: @astro3.id, mission_id: @mission2.id)
    @astronaut_mission9 = AstronautMission.create!(astronaut_id: @astro3.id, mission_id: @mission3.id)

    visit "/astronauts/#{@astro1.id}"
  end

  describe "Astronaut Detail Page" do
    it "Shows the astronaut's name" do
      expect(page).to have_content("Astronaut: #{@astro1.name}")
    end

    it "Shows the list of missions the astronaut has been on" do
      expect(page).to have_content("#{@mission1.title}")
      expect(page).to have_content("#{@mission2.title}")
      expect(page).to have_content("#{@mission3.title}")
    end

    it "Has a form to add a new mission to the astronaut's list" do
      expect(page).to have_content("Add a mission by ID:")
    end

    it "Returns to the show page with a the new mission when the new mission form is filled with valid information" do
      expect(page).to_not have_content("#{@mission4.title}")

      fill_in "Add a mission by ID:", with: @mission4.id
      expect(current_path).to eq("/astronauts/#{@astro1.id}")
      expect(page).to have_content("#{@mission4.title}")

    end
  end
end