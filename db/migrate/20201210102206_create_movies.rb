class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.text :title
      t.string :youtube_url
      t.timestamps
    end
  end
end
