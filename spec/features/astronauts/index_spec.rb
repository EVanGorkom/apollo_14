require 'rails_helper'

RSpec.describe "Astronaut Index Page" do
  before :each do
    @astro1 = Astronaut.create!(name: "Buzz Aldren", age: 35, job: "Pilot")
    @astro2 = Astronaut.create!(name: "Neil Armstrong", age: 36, job: "Pilot")
    @astro3 = Astronaut.create!(name: "Michael Collins", age: 37, job: "Mechanic")

    visit "/astronauts"
  end

  describe "Astronaut Details" do
    it "Shows the detailed information of each astronaut on the page" do
      save_and_open_page
      expect(page).to have_content("Name: #{@astro1.name}, Age: #{@astro1.age}, Job: #{@astro1.job}")
      expect(page).to have_content("Name: #{@astro2.name}, Age: #{@astro2.age}, Job: #{@astro2.job}")
      expect(page).to have_content("Name: #{@astro3.name}, Age: #{@astro3.age}, Job: #{@astro3.job}")
    end
  end
end