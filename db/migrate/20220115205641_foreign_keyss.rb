class ForeignKeyss < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key "experiences", "profiles"
    add_foreign_key "projects", "experiences"
  end
end
