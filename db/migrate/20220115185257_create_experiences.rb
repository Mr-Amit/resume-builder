class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :position
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
