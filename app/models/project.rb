class Project <ApplicationRecord
  def contestants_count
    @project.contestants.count
  end
  validates_presence_of :name, :material, :theme
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects
end
