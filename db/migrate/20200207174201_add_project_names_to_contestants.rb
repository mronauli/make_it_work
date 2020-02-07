class AddProjectNamesToContestants < ActiveRecord::Migration[5.2]
  def change
    add_column :contestants, :project_names, :string
  end
end
