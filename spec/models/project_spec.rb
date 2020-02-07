require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "class methods" do
    it "#contestants_count" do
      challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      project_1 = Project.create(name: "News Chic", material: "Newspaper", theme: challenge_1.theme, challenge: challenge_1)
      contestant_1 = Contestant.create(name: "Kentaro Kameyama", hometown: "denver", age: 30, years_of_experience: 5, project_names:project_1.name, projects: project_1)
      expect(Project.contestants_count).to eq(1)
    end
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end
end
