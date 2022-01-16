class Datatypesinttobigagain < ActiveRecord::Migration[6.1]
  def up
    change_column :projects, :experience_id, :bigint
  end
end
