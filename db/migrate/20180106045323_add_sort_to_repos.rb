class AddSortToRepos < ActiveRecord::Migration[5.1]
  def change
    add_column :repos, :sort, :integer
  end
end
