class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :url
      t.string :tech_stack
      t.text :description

      t.timestamps
    end
  end
end
