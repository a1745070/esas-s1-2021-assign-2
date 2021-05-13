class AddDirectorToMovie < ActiveRecord::Migration[6.1]
  def up
    add_column :movies, :director, :string
  end
end
 