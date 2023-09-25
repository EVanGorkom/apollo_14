require 'rails_helper'

RSpec.describe "Astronaut Index Page" do
  before :each do
    @astro1 = Astronaut.create!(name: "Buzz Aldren", age: 35, job: "Pilot")
    @astro2 = Astronaut.create!(name: "Neil Armstrong", age: 36, job: "Pilot")
    @astro3 = Astronaut.create!(name: "Michael Collins", age: 37, job: "Mechanic")

    @mission1 = Mission.create!(title: "Apollo 11", time_in_space: 111)
    @mission2 = Mission.create!(title: "Apollo 12", time_in_space: 112)
    @mission3 = Mission.create!(title: "Apollo 13", time_in_space: 113)

    @astronaut_mission1 = AstronautMission.create!(astronaut_id: @astro1.id, mission_id: @mission1.id)
    @astronaut_mission2 = AstronautMission.create!(astronaut_id: @astro1.id, mission_id: @mission2.id)
    @astronaut_mission3 = AstronautMission.create!(astronaut_id: @astro1.id, mission_id: @mission3.id)

    @astronaut_mission4 = AstronautMission.create!(astronaut_id: @astro2.id, mission_id: @mission1.id)
    @astronaut_mission5 = AstronautMission.create!(astronaut_id: @astro2.id, mission_id: @mission2.id)
    @astronaut_mission6 = AstronautMission.create!(astronaut_id: @astro2.id, mission_id: @mission3.id)

    @astronaut_mission7 = AstronautMission.create!(astronaut_id: @astro3.id, mission_id: @mission1.id)
    @astronaut_mission8 = AstronautMission.create!(astronaut_id: @astro3.id, mission_id: @mission2.id)
    @astronaut_mission9 = AstronautMission.create!(astronaut_id: @astro3.id, mission_id: @mission3.id)

    visit "/astronauts"
  end

  describe "Astronaut Details" do
    it "Shows the detailed information of each astronaut on the page" do
      expect(page).to have_content("Name: #{@astro1.name}, Age: #{@astro1.age}, Job: #{@astro1.job}")
      expect(page).to have_content("Name: #{@astro2.name}, Age: #{@astro2.age}, Job: #{@astro2.job}")
      expect(page).to have_content("Name: #{@astro3.name}, Age: #{@astro3.age}, Job: #{@astro3.job}")
    end
  
    it "Shows the average age of all astronauts" do
      expect(page).to have_content("Average Age: 36")
    end

    it "Shows the list of space missions each astronaut has gone on in alphabetical order" do
      within("##{@astro1.id}") do
        expect(page).to have_content("#{@mission1.title}")
        expect(page).to have_content("#{@mission2.title}")
        expect(page).to have_content("#{@mission3.title}")
      end
    end

    it "Shows the Astronaut's total time in space" do
      within("##{@astro1.id}") do
        expect(page).to have_content("Total Time in Space: #{@astro1.total_space_time}")
      end

      within("##{@astro2.id}") do
        expect(page).to have_content("Total Time in Space: #{@astro2.total_space_time}")
      end

      within("##{@astro3.id}") do
        expect(page).to have_content("Total Time in Space: #{@astro3.total_space_time}")
      end
    end
  end
end