class CreateProgressPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :progress_photos do |t|
      t.integer :user_id
      t.text :comment
      t.string :picture

      t.timestamps
    end
  end
end
