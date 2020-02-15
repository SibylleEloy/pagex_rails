class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :text
      t.string :image
      t.string :video
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
