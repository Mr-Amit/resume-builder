class Datatypesinttobig < ActiveRecord::Migration[6.1]
  def up
    change_column :experiences, :profile_id, :bigint
  end
end
