class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :user
      t.string :word
      t.string :mean
      t.integer :level

      t.timestamps
    end
    add_index :cards, :user_id
  end
end
