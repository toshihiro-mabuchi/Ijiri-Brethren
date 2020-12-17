class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.datetime :issue_date, null: false

      t.timestamps
    end
  end
end
