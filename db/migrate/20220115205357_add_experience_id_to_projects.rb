class AddExperienceIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :experience_id, :integer
    add_index :projects, :experience_id
  end
end
