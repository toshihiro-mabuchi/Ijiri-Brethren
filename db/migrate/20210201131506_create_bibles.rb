class CreateBibles < ActiveRecord::Migration[5.2]
  def change
    create_table :bibles do |t|
      t.text :title
      t.text :subtitle
      t.text :text
      t.boolean :display_flag, defauit: false

      t.timestamps
    end
  end
end
