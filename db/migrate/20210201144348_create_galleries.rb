class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :category
      t.string :title
      t.integer :display, default: 1, null: false

      t.timestamps
    end
  end
end
