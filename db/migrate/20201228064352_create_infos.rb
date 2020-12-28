class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :title
      t.text :content
      t.string :image
      t.integer :display_flag, default: 0

      t.timestamps
    end
  end
end
