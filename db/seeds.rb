# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

astro1 = Astronaut.create!(name: "Buzz Aldren", age: 35, job: "Pilot")
astro2 = Astronaut.create!(name: "Neil Armstrong", age: 36, job: "Captain")
astro3 = Astronaut.create!(name: "Michael Collins", age: 37, job: "Mechanic")

mission1 = Mission.create!(title: "Apollo 11", time_in_space: 111)
mission2 = Mission.create!(title: "Apollo 12", time_in_space: 112)
mission3 = Mission.create!(title: "Apollo 13", time_in_space: 113)
mission4 = Mission.create!(title: "Gemini 11", time_in_space: 114)

astronaut_mission1 = AstronautMission.create!(astronaut_id: astro1.id, mission_id: mission1.id)
astronaut_mission2 = AstronautMission.create!(astronaut_id: astro1.id, mission_id: mission2.id)
astronaut_mission3 = AstronautMission.create!(astronaut_id: astro1.id, mission_id: mission3.id)

astronaut_mission4 = AstronautMission.create!(astronaut_id: astro2.id, mission_id: mission1.id)
astronaut_mission5 = AstronautMission.create!(astronaut_id: astro2.id, mission_id: mission2.id)
astronaut_mission6 = AstronautMission.create!(astronaut_id: astro2.id, mission_id: mission3.id)

astronaut_mission7 = AstronautMission.create!(astronaut_id: astro3.id, mission_id: mission1.id)
astronaut_mission8 = AstronautMission.create!(astronaut_id: astro3.id, mission_id: mission2.id)
astronaut_mission9 = AstronautMission.create!(astronaut_id: astro3.id, mission_id: mission3.id)