require "rails_helper"

RSpec.describe "project's page", type: :feature do
  context "as a visitor" do
    challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    challenge_2 = Challenge.create(theme: "Retro Cotton", project_budget: 700)
    project_1 = Project.create(name: "News Chic", material: "Newspaper", theme: challenge_1.theme, challenge: challenge_1)
    project_2 = Project.create(name: "Retro", material: "Cotton", theme: challenge_2.theme, challenge: challenge_2)
    contestant_1 = Contestant.create!(name: "Kentaro Kameyama", hometown: "denver", age: 30, years_of_experience: 5, project_names:[project_1.name, project_2.name], projects:[project_1, project_2])

    it "can see a a list of contestants and their projects" do
      visit "/contestants"

      expect(page).to have_content(contestant_1.name)
      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_1.material)
      expect(page).to have_content(project_1.theme)

      expect(page).to have_content(project_2.name)
      expect(page).to have_content(project_2.material)
      expect(page).to have_content(project_2.theme)
    end
  end
end
