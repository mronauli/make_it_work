require "rails_helper"

RSpec.describe "project's page", type: :feature do
  context "as a visitor" do
    challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project_1 = Project.create(name: "News Chic", material: "Newspaper", theme: challenge_1.theme, challenge: challenge_1)

    it "can see a project's name, material and challenge theme" do

      visit "/projects/#{project_1.id}"
      expect(current_path).to eq("/projects/#{project_1.id}")
      expect(page).to have_content(project_1.name)
      expect(page).to have_content(project_1.material)
      expect(page).to have_content(project_1.theme)
    end
  end
  it "can see a count of contestants on a project" do
    challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    project_1 = Project.create(name: "News Chic", material: "Newspaper", theme: challenge_1.theme, challenge: challenge_1)
    contestant_1 = Contestant.create(name: "Kentaro Kameyama", hometown: "denver", age: 30, years_of_experience: 5, project_names: [project_1.name], projects: [project_1])
    visit "/projects/#{project_1.id}"
    expect(page).to have_content(project_1.name)
    expect(page).to have_content(project_1.material)
    expect(page).to have_content("Number of Contestants #{project_1.count_contestants}")
  end
end
