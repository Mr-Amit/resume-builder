class AddProfileIdToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_column :experiences, :profile_id, :integer
    add_index :experiences, :profile_id
  end
end
