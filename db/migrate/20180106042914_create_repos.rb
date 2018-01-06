class CreateRepos < ActiveRecord::Migration[5.1]
  def change
    create_table :repos do |t|
      t.string :site_name
      t.string :site_url
      t.string :github_name
      t.string :github_url
      t.string :account
      t.string :password
      t.string :description

      t.timestamps
    end
  end
end
