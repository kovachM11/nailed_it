class CreateDevelopments < ActiveRecord::Migration[5.1]
  def change
    create_table :developments do |t|
      t.integer :user_id
      t.text :trigger
      t.integer :action_id

      t.timestamps
    end
  end
end
