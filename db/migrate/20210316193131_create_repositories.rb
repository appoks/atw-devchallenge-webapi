class CreateRepositories < ActiveRecord::Migration[6.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :owner_name
      t.string :owner_avatar
      t.string :description
      t.string :creation_date
      t.string :last_activity_date
      t.string :homepage
      t.references :language, null: false, foreign_key: true
      t.integer :forks
      t.integer :issues
      t.integer :watchers
      t.integer :stars
      t.float :score
      t.string :repo_url
      t.integer :github_id

      t.timestamps
    end
  end
end
