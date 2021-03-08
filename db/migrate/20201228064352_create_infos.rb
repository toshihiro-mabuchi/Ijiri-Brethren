class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :title
      t.text :content
      t.string :color
      t.integer :category, default: 0
      t.boolean :display_flag, default: false

      t.timestamps
    end
  end
end
